Class {
	#name : #COMElemDesc,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_DATA',
		'OFFSET_TDESC'
	],
	#pools : [
		'COMTypes'
	],
	#category : 'PharoCOM-Types'
}

{ #category : #'as yet unclassified' }
COMElemDesc class >> fieldsDesc [
	"
		self rebuildFieldAccessors.
	"
	^ #(
		TYPEDESC tdesc;
		PARAMDESC data
	)
]

{ #category : #querying }
COMElemDesc >> calculateType [
	^ self tdesc calculateType.
]

{ #category : #'accessing structure variables' }
COMElemDesc >> data [
	"This method was automatically generated"
	^ COMParamDesc fromHandle: (handle referenceStructAt: OFFSET_DATA length: COMParamDesc byteSize)
]

{ #category : #'accessing structure variables' }
COMElemDesc >> data: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_DATA put: anObject getHandle length: COMParamDesc byteSize
]

{ #category : #'accessing structure variables' }
COMElemDesc >> tdesc [
	"This method was automatically generated"
	^ COMTypeDesc fromHandle: (handle referenceStructAt: OFFSET_TDESC length: COMTypeDesc byteSize)
]

{ #category : #'accessing structure variables' }
COMElemDesc >> tdesc: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_TDESC put: anObject getHandle length: COMTypeDesc byteSize
]
