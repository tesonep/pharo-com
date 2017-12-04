Class {
	#name : #FFIExternalVTableObject,
	#superclass : #FFIExternalObject,
	#category : 'VTable-FFI-Extension'
}

{ #category : #'ffi-calls' }
FFIExternalVTableObject >> ffiCall: fnSpec at: tablePosition [
	^ (self ffiCalloutIn: thisContext sender)
		convention: self ffiCallingConvention;
		tablePosition: tablePosition;
		function: fnSpec module: nil
]

{ #category : #'ffi-calls' }
FFIExternalVTableObject >> ffiCalloutIn: aContext [
	^ VTableFFICalloutAPI inContext: aContext
]

{ #category : #'ffi-calls' }
FFIExternalVTableObject >> modifyFFICall: ffiCall withTablePosition: tablePosition [
	ffiCall setHandle: (self vtable pointerAt: ((tablePosition - 1) * Smalltalk wordSize) + 1).
	^ ffiCall.
]

{ #category : #accessing }
FFIExternalVTableObject >> vtable [
	handle isNull
		ifTrue: [ ^ nil ].
	^ handle pointerAt: 1
]
