Class {
	#name : #BSTRString,
	#superclass : #FFIExternalObject,
	#traits : 'TWinErrorChecker',
	#classTraits : 'TWinErrorChecker classTrait',
	#pools : [
		'COMTypes'
	],
	#category : #'PharoCOM-Types'
}

{ #category : #finalization }
BSTRString class >> finalizeResourceData: handle [
	(self fromHandle: handle) finalize.
]

{ #category : #'instance creation' }
BSTRString class >> fromString: aString [
	| wstr handle |
	wstr := Win32WideString fromString: aString.
	handle := (OleAut32Lib uniqueInstance ffiSysAllocString: wstr) getHandle.

	handle isNull
		ifTrue: [ Kernel32Lib uniqueInstance reportError: 0 ].
		
	^ self fromHandle: handle
]

{ #category : #converting }
BSTRString >> asString [
	^ (Win32WideString fromHandle: handle) asString.
]

{ #category : #finalization }
BSTRString >> finalize [
	handle isNull ifFalse:[ OleAut32Lib uniqueInstance ffiSysFreeString: self ].
	handle beNull.
]
