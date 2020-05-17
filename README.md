# PharoWin32 


PharoWin32 is a repository to support Pharo developers in Windows environments. Among other goodies it enables operations on the windows registry, work with GUIDs, kernel32.lib, user32.lib, Windows data types, etc. It also includes a package PharoCOM to provide an interface for software components intercommunication on Windows operating systems (https://en.wikipedia.org/wiki/Component_Object_Model). 


## Code loading

The default group loads PharoWin32, PharoCOM, VTable-FFI-Extension and related packages:

For Pharo 8 and 9 the version to use is the one in master:

```smalltalk
Metacello new
  baseline: 'PharoWin32';
  repository: 'github://tesonep/pharo-com';
  load.
```

As the UFFI support have changed in Pharo 8, to use this project in Pharo 7 32-bits we have to load the v1.0.0 version, with: 

```smalltalk
Metacello new
  baseline: 'PharoWin32';
  repository: 'github://tesonep/pharo-com:v1.0.0';
  load.
```
Sadly, we have not support for Pharo 7 64bits.
The support for 64bits requires changes done in UFFI in Pharo 8. So, sadly if you want to use 64bits images please use at least Pharo8.

## Basic usage 

Basic usage can be seen from test examples (PharoWin32-Tests, PharoWin32-Registry-Tests, PharoCOM-Tests). 

### COM components 

COM components can be created and controlled relatively easy. We firstly initialize Ole32Lib library:

```smalltalk
Ole32Lib uniqueInstance initLibrary.
```

An instance of a COM component can be crated by CLSID or by its name:

```smalltalk
wrd := COMDispatchInstance createInstanceByName: 'Word.Application'.
```

If a component is an application, it presents itself as a Windows process. We can set its properties:

```smalltalk
wrd propertyNamed: 'Visible' put: true.
```

(MS Word should appear on the desktop.) In the same way we can get the value of the property Documents which holds a collection of documents:

```smalltalk
documents := wrd propertyNamed: 'Documents'.
```

A variable `documents` now represents another COMDispatchInstance (besides Word application) which is a COM object in external memory. We can communicate with it like in:

```smalltalk
documents dispatch: 'Add'.
```

This is actually a method call to Documents.Add() which adds a new blank document to the Documents collection. The document shows itself in Word's application window. Another component enables document editing:

```smalltalk
selection := wrd propertyNamed: 'Selection'. 
selection dispatch: 'TypeText' withArguments: { 'Hello from Pharo!' }.
```

Here we did a method call to Selection.TypeText("Hello from Pharo!"). After that we can select all the text in the active document and get it back to Pharo:

```smalltalk
selection dispatch: 'WholeStory' .
textFromWord := selection propertyNamed: 'Text'.
```

When we don't need the services of the server COM object anymore, we tell that to COM system by:

```smalltalk
wrd finalize.
```


So, in PharoCOM we have these methods to manipulate components:
- `COMDispatchInstance class>>#createInstanceByName:` and `COMDispatchInstance class>>#createInstanceOf:` to create COM components
- `COMDispatchInstance>>#propertyNamed:`, `COMDispatchInstance>>#propertyNamed:withArguments:` and `COMDispatchInstance>>#propertyNamed:put:` to read and write from their properties
- `COMDispatchInstance>>#dispatch:` and `COMDispatchInstance>>#dispatch:withArguments:` to call upon components' methods. Arguments should be given in a form of an Array.
- `COMUnknownInstance>>#finalize` to release a COM component (technically, this decrements the reference count for an interface on a COM object).

### COM data marshalling

COM data marshalling is done by a special "variant" data types (https://en.wikipedia.org/wiki/Variant_type). Usually, when the server component receives a dispatch from us, it tries to convert arguments (if any) by firstly issuing a call to the VariantChangeType() API function in OleAut32.dll. In this way, the argument's value is converted to a data type that is expected by the server method. If this doesn't succeeed, a dispatch fails. At the moment, PharoCOM supports variant types as follows from the table bellow. That's why this argument passing is normally not problematic, however we should pay attention - for instance, if COM server method expects an integer and we send it a string '15', it will convert it into an integer 10 just fine.

When a variant is returned from a dispatch method, it is converted to a Pharo instance of a certain type. The conversion is done by Pharo variant type (please see the table below). For instance, if the received value is of VT_I4 type, it is converted to Integer and the way that conversion is done can be checked in Win32VariantInt32>>#readFrom:. Similarly, when receiving a pointer to a COM component (as VT_DISPATCH), it is converted to COMDispatchInstance by Pharo variant type of Win32VariantCOMInstance.

When we are sending the array of arguments with a COM dispatch, the type of each argument is firstly checked by Pharo against the COM server method interface (COM mechanism supports meta data exchange). The conversion is again done by Pharo variant type. For instance, if the argument type should be BSTR, a Win32VariantBSTRString does the conversion by Win32VariantBSTRString>>#write: aValue to: aVariant. 

In the case when the COM server accepts general types like VT_VARIANT or VT_USERDEFINED, the aValue that has to be sent as an argument takes the decision responsibility and calls an appropriate Pharo variant type. For instance, if the argument should be a variant of undefined subtype and we are sending aString, then Win32VariantType calls aString's #asWin32VariantInto: method which chooses Win32VariantBSTRString as a proper Pharo variant type do to the actual conversion. 

The classes in the fourth column in the table bellow can act as "elementary" types and implement the #asWin32VariantInto: method.

VarType    | Propvariant Type | Pharo variant type      | Pharo base class/instances 
-----------|------------------|-------------------------|---------------------------
1   | VT_NULL          | Win32VariantNull 1)     | 1)
2   | VT_I2            | Win32VariantInt16       | /
3   | VT_I4            | Win32VariantInt32       | SmallInteger
5   | VT_R8            | Win32VariantDouble      | Float
7   | VT_DATE          | Win32VariantDate        | Date, DateAndTime
8   | VT_BSTR          | Win32VariantBSTRString  | String
9   | VT_DISPATCH      | Win32VariantCOMInstance | /
11   | VT_BOOLEAN       | Win32VariantBool        | Boolean    
12   | VT_VARIANT       | Win32VariantType        | 2)
13   | VT_UNKNOWN       | Win32VariantCOMInstance | /
14   | VT_DECIMAL       | Win32VariantDecimal     | ScaledDecimal 3)
24   | VT_VOID          | Win32VariantVoid        | / 
26   | VT_PTR           | Win32VariantPointer     | 2)
29   | VT_USERDEFINED   | Win32VariantUserDefined | /
 
1) Reading from variant of VT_NULL type returns nil, writing into VT_NULL is done by sending Win32VariantNull>>#write: aValue to: aVariant, where aValue is ignored
2) To prepare a variant as VT_VARIANT, use Win32VariantPointer>>checkIfElementaryTypeAndWrite: aValue to: aVariant. This method implements a pointer VT_VARIANT | VT_BYREF - that is, our variant becomes a pointer which points to another variant structure in memory with the actual value
3) Writing to VT_DECIMAL is implemented as Win32VariantDecimal>>#write: aValue to: aVariant. If the passing aValue is ScaledDecimal, the corresponding scale is used in marshalling. Otherwise, the default scale is 2. The scale means the number of digits to the right of the decimal point.

For "simple" dispatch activities and propery getters and setters the types conversion is done automatically. A direct reading and writing to variants is not necessary if we use the methods #dispatch:withArguments: and #propertyNamed:withArguments:. If you eventually need this, it can be done by firstly reserving an external memory space as:

```smalltalk
variant := Win32Variant externalNew.
```

A COM client is responsible for memory management, so we should release the space when it is not needed anymore. Besides, the variant has to be initialized by the COM system:

```smalltalk
variant autoRelease .
variant init.
```

Then, we create an appropriate type and set the VT tag of the variant:

```smalltalk
type := Win32Variant typeFor: 14. "<-- decimal"
variant vt: type typeNumber .
```

Finally, we can actually write the value with:

```smalltalk
type write: (12345.54321 asScaledDecimal: 4) to: variant.
```

Reading is done by:

```smalltalk
type readFrom: variant  ---> "12345.5432s4"
```

## Development, Goals, Contributing

The main goal of PharoWin32 is to offer a toolset to Pharo users and developers as a way of communication with Windows platform and other process instances on it. Right now, PharoWin32 is a prototype. A basic level of COM automation can be achieved as described above. Try it out in your usage scenarios. Please report your experiences and possible issues on GitHub. 

The quality of open source software is determined by it being alive, supported and maintained.

The first way to help is to simply use PharoWin32 in your projects and tells us about 
your successes and the issues that you encounter. You can ask questions on the Pharo mailing lists.

Development happens on GitHub, where you can create issues. The majority of most usable variant types is already implemented. However, if you receive (from a dispatch call) a variant type that is not implemented yet, an error will occur with a subclassResponsibility message from Win32VariantType. You can check the returned type by debugger and COMDispatchInstance inspector and report this as an issue. Similarly, the call will not succeed if a COM method doesn't receive argument values that can be converted into the form that is expected.

Contributions should be done with pull requests solving specific issues.
