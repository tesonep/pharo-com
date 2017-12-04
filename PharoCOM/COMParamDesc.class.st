Class {
	#name : #COMParamDesc,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_PPARAMDESCEX',
		'OFFSET_WPARAMFLAGS'
	],
	#pools : [
		'COMTypes'
	],
	#category : 'PharoCOM-Types'
}

{ #category : #'as yet unclassified' }
COMParamDesc class >> fieldsDesc [
	"
		self rebuildFieldAccessors.
	"
	^ #(
    LPPARAMDESCEX pparamdescex;
    USHORT wParamFlags;
	)
]

{ #category : #'accessing structure variables' }
COMParamDesc >> pparamdescex [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PPARAMDESCEX) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
COMParamDesc >> pparamdescex: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PPARAMDESCEX put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
COMParamDesc >> wParamFlags [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_WPARAMFLAGS
]

{ #category : #'accessing structure variables' }
COMParamDesc >> wParamFlags: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_WPARAMFLAGS put: anObject
]
