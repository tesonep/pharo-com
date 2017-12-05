Class {
	#name : #COMTypeDesc,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_CONTENT',
		'OFFSET_VT'
	],
	#pools : [
		'COMTypes'
	],
	#category : 'PharoCOM-Types'
}

{ #category : #'field definition' }
COMTypeDesc class >> fieldsDesc [
	"
		self rebuildFieldAccessors.
	"

	^ #(
		void* content;
		VARTYPE vt;
	)
]

{ #category : #querying }
COMTypeDesc >> calculateType [
	| type internalType |
	type := self translateType.

	(self isPointerType) ifTrue: [  
		internalType := COMTypeDesc fromHandle: self content getHandle.
		type := Win32VariantPointer wrap: internalType calculateType.
	].

	^ type.
]

{ #category : #'accessing structure variables' }
COMTypeDesc >> content [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_CONTENT) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
COMTypeDesc >> content: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_CONTENT put: anObject getHandle.
]

{ #category : #testing }
COMTypeDesc >> isPointerType [
	^ Win32Variant isPointer: self vt
]

{ #category : #types }
COMTypeDesc >> translateType [ 
	^ Win32Variant typeFor: self vt.
]

{ #category : #'accessing structure variables' }
COMTypeDesc >> vt [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_VT
]

{ #category : #'accessing structure variables' }
COMTypeDesc >> vt: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_VT put: anObject
]
