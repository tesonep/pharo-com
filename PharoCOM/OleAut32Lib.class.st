Class {
	#name : #OleAut32Lib,
	#superclass : #FFILibrary,
	#pools : [
		'COMTypes'
	],
	#category : #PharoCOM
}

{ #category : #'as yet unclassified' }
OleAut32Lib >> ffiLoadRegTypeLibGuid: rguid versionMajor: wVerMajor versionMinor: wVerMinor languageId: lcid libraryHolder: pptlib [
	self
		ffiCall:
			#(HRESULT LoadRegTypeLib(REFGUID rguid , WORD wVerMajor , WORD wVerMinor , LCID lcid , POINTER_HOLDER pptlib))
]

{ #category : #'as yet unclassified' }
OleAut32Lib >> ffiLoadTypeLibEx: aPath into: typeLib [
	" 
	https://docs.microsoft.com/en-us/windows/win32/api/oleauto/nf-oleauto-loadtypelibex
HRESULT LoadTypeLibEx(
  LPCOLESTR szFile,
  REGKIND   regkind,
  ITypeLib  **pptlib
);
Identifies the kind of registration to perform for the type library based on the following flags: DEFAULT, REGISTER and NONE. REGKIND_DEFAULT simply calls LoadTypeLib and registration occurs based on the LoadTypeLib registration rules. REGKIND_NONE calls LoadTypeLib without the registration process enabled. REGKIND_REGISTER calls LoadTypeLib followed by RegisterTypeLib, which registers the type library. To unregister the type library, use UnRegisterTypeLib.

	tl;dr: 	REGKIND_NONE means to not register the DLL. 
	REGKIND_NONE = 2 "
	^ self ffiCall: #(HRESULT LoadTypeLibEx #(BSTR aPath, 2, POINTER_HOLDER typeLib))
]

{ #category : #'ffi-calls' }
OleAut32Lib >> ffiSysAllocString: aWin32WideString [
	self ffiCall: #(void* SysAllocString (LPWSTR aWin32WideString))
]

{ #category : #'as yet unclassified' }
OleAut32Lib >> ffiSysFreeString: bstrString [
	self ffiCall: #(void SysFreeString #(BSTR bstrString))
]

{ #category : #'as yet unclassified' }
OleAut32Lib >> ffiVariantClear: aPointer [
	^ self ffiCall: #(HRESULT VariantClear #(void * aPointer))
]

{ #category : #'as yet unclassified' }
OleAut32Lib >> ffiVariantInit: pointer [
	^ self ffiCall: #(void VariantInit #(void * pointer))
]

{ #category : #'as yet unclassified' }
OleAut32Lib >> loadTypeLibEx: aPath [
	| holder |
	holder := POINTER_HOLDER new.
	self
		ffiLoadTypeLibEx: (BSTRString fromString: aPath)
		into: holder.
	^ COMTypeLib fromHandle: holder value
]

{ #category : #'accessing platform' }
OleAut32Lib >> win32ModuleName [ 
	^ 'OleAut32.dll'
]
