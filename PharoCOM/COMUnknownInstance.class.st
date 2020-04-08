Class {
	#name : #COMUnknownInstance,
	#superclass : #FFIExternalVTableObject,
	#traits : 'TWinErrorChecker',
	#classTraits : 'TWinErrorChecker classTrait + TWinErrorChecker',
	#pools : [
		'COMTypes'
	],
	#category : #PharoCOM
}

{ #category : #'instance creation' }
COMUnknownInstance class >> basicFromHandle: aHandle [
	^ super fromHandle: aHandle
]

{ #category : #finalization }
COMUnknownInstance class >> finalizeResourceData: handle [
	(self basicFromHandle: handle) finalize.
]

{ #category : #'instance creation' }
COMUnknownInstance class >> fromHandle: aHandle [
	^ (self basicFromHandle: aHandle)
		autoRelease;
		yourself
]

{ #category : #'reference counting' }
COMUnknownInstance >> addRef [
	handle isNull ifTrue:[ ^ self ].
	^ self ffiAddRef.
]

{ #category : #converting }
COMUnknownInstance >> asWin32VariantInto: aVariant [
	| type | 
	type := Win32Variant typeFor: 9. "<-- can this be done with #COMDispatchInstance and TypeMapping?"
	type write: self to: aVariant
]

{ #category : #'reference counting' }
COMUnknownInstance >> ffiAddRef [

	^ self ffiCall: #(ULONG AddRef(self)) at: 2
]

{ #category : #resources }
COMUnknownInstance >> ffiLibrary [

	^ OleAut32Lib
]

{ #category : #'ffi-calls' }
COMUnknownInstance >> ffiQueryInterface: riid into: holder [

	^ self ffiCall: #(HRESULT QueryInterface(self, GUID* riid, void** holder)) at: 1
]

{ #category : #finalization }
COMUnknownInstance >> finalize [
	handle isNull ifFalse:[ self release ].
	handle beNull.
]

{ #category : #querying }
COMUnknownInstance >> queryInterface: aGUID returnClass: aClass [
	| holder ret |
	holder := ExternalAddress allocate: Smalltalk wordSize.
	holder autoRelease.
	
	ret := self ffiQueryInterface: aGUID into: holder.
	
	self reportErrorIfNoZero: ret.
	
	^ (aClass fromHandle: holder).
]

{ #category : #'reference counting' }
COMUnknownInstance >> release [

	^ self ffiCall: #(ULONG Release(self)) at: 3
]
