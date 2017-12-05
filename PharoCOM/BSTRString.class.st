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

{ #category : #converting }
BSTRString >> asString [
	^ (Win32WideString fromHandle: handle) asString.
]

{ #category : #finalization }
BSTRString >> finalize [
	handle isNull ifFalse:[ OleAut32Lib uniqueInstance ffiSysFreeString: self ].
	handle beNull.
]
