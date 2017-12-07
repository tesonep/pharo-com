Class {
	#name : #COMDispatchInstance,
	#superclass : #COMUnknownInstance,
	#instVars : [
		'typeInfo',
		'dispatchType'
	],
	#pools : [
		'COMTypes'
	],
	#category : 'PharoCOM'
}

{ #category : #'instance creation' }
COMDispatchInstance class >> createInstanceByName: aName [
	| regKey clsid |
	
	regKey := WinRegRootEntry HKEY_CLASSES_ROOT / aName / 'CLSID'.
	clsid := regKey defaultValue value.
	
	^ self createInstanceOf: clsid
]

{ #category : #'instance creation' }
COMDispatchInstance class >> createInstanceOf: clsidString [
	| refiid pointer ret clsid |
	refiid := GUID fromString: '{00020400-0000-0000-C000-000000000046}'.
	clsid := GUID fromString: clsidString.
	
	pointer := ExternalAddress allocate: Smalltalk wordSize.
	pointer autoRelease.

	ret := Ole32Lib uniqueInstance ffiCoCreateInstance:pointer of:clsid as: refiid.
	self reportErrorIfNoZero: ret.
	
	^ self fromHandle: (pointer pointerAt: 1).
]

{ #category : #invoking }
COMDispatchInstance >> dispatch: aFunctionName [ 
	^ self dispatch: aFunctionName withArguments: #().
]

{ #category : #invoking }
COMDispatchInstance >> dispatch: aFunctionName withArguments: arguments [ 
	| func |
	func := self getDispatchType functions detect:[ :e | e name = aFunctionName ].
	^ func invokeOn: self withArgs: arguments.
]

{ #category : #'ffi-calls' }
COMDispatchInstance >> ffiGetTypeInfo: iTInfo lcid: lcid into: holder [

	^ self ffiCall: #(HRESULT GetTypeInfo(self, UINT iTInfo, LCID lcid, void** holder)) at: 5.	

]

{ #category : #'ffi-calls' }
COMDispatchInstance >> ffiGetTypeInfoCount: holder [

	^ self ffiCall: #(HRESULT GetTypeInfoCount(self, UINT* holder)) at: 4
]

{ #category : #'ffi-calls' }
COMDispatchInstance >> ffiInvokeMemberId: memid refiid: refiid lcid: lcid flags: wFlags params: dispparams resultHolder: resultHolder exceptionInfo: excepInfo argumentError: argumentErrorHolder [ 
	^ self ffiCall: #(HRESULT Invoke ( 
            self,
            MEMBERID memid,
			   GUID* refiid,
			   LCID lcid,
            WORD wFlags,
            COMDispParams* dispparams,
            Win32Variant* resultHolder,
            COMExcepInfo* excepInfo,
            void* argumentErrorHolder)) at: 7
]

{ #category : #querying }
COMDispatchInstance >> getDispatchType [
	^ (dispatchType isNil or: [ dispatchType isNull ])
		ifTrue: [ dispatchType := self getTypeInfo dispatchInterface ]
		ifFalse: [ dispatchType ]
]

{ #category : #querying }
COMDispatchInstance >> getTypeInfo [
	(typeInfo isNil or: [ typeInfo isNull ])
		ifTrue: [ typeInfo := self getTypeInfo: 0 lcid: LOCALE_USER_DEFAULT ].

	^ typeInfo
]

{ #category : #querying }
COMDispatchInstance >> getTypeInfo: iTInfo lcid: lcid [
	| return pointer |
	
	pointer := ExternalAddress allocate: Smalltalk wordSize.
	pointer autoRelease.
	
	return := self ffiGetTypeInfo: iTInfo lcid: lcid into: pointer.
	
	self reportErrorIfNoZero: return.

	typeInfo := COMTypeInfo fromHandle:  pointer.
	^ typeInfo.
]

{ #category : #querying }
COMDispatchInstance >> getTypeInfoCount [
	| return pointer |
	
	pointer := ExternalAddress allocate: Smalltalk wordSize.
	pointer autoRelease.
	
	return := self ffiGetTypeInfoCount: pointer.
	
	self reportErrorIfNoZero: return.
	
	^ pointer unsignedLongAt: 1.
]

{ #category : #'gt-inspector-extension' }
COMDispatchInstance >> gtInspectorPage: aComposer [
	<gtInspectorPresentationOrder: 1>  

	COMDispatchInstanceInspector new buildPresentationOn: aComposer for: self.
]

{ #category : #properties }
COMDispatchInstance >> propertyNamed: aPropName [ 
	| prop |
	prop := self getDispatchType properties detect: [ :e | e name = aPropName ].
	^ prop getFrom: self.
]

{ #category : #properties }
COMDispatchInstance >> propertyNamed: aPropName put: aValue [
	| prop |
	prop := self getDispatchType properties detect: [ :e | e name = aPropName ].
	^ prop write: aValue to: self.
]

{ #category : #querying }
COMDispatchInstance >> queryInterfaceAsDipatchInstance: aGUID [ 
	^ self queryInterface: aGUID returnClass: COMDispatchInstance.
]
