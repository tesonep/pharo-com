Class {
	#name : #COMVarDesc,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_ELEMDESCVAR',
		'OFFSET_LPSTRSCHEMA',
		'OFFSET_LPVARVALUE',
		'OFFSET_MEMID',
		'OFFSET_VARKIND',
		'OFFSET_WVARFLAGS'
	],
	#pools : [
		'COMTypes'
	],
	#category : #'PharoCOM-Types'
}

{ #category : #'field definition' }
COMVarDesc class >> fieldsDesc [
	"
		self rebuildFieldAccessors.
	"

	^ #(
   MEMBERID memid;
  LPOLESTR lpstrSchema;
   VARIANT *lpvarValue;
  ELEMDESC elemdescVar;
  WORD     wVarFlags;
  VARKIND  varkind;
	)
]

{ #category : #'accessing structure variables' }
COMVarDesc >> elemdescVar [
	"This method was automatically generated"
	^ COMElemDesc fromHandle: (handle referenceStructAt: OFFSET_ELEMDESCVAR length: COMElemDesc byteSize)
]

{ #category : #'accessing structure variables' }
COMVarDesc >> elemdescVar: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_ELEMDESCVAR put: anObject getHandle length: COMElemDesc byteSize
]

{ #category : #'accessing structure variables' }
COMVarDesc >> hasValueToRead [

	self varkind = COMVarKind static ifTrue: [ 
		self halt: ' We should think what happen in the static case ' ].
	^ ({ 
		   COMVarKind perInstance.
		   COMVarKind dispatch } includes: self varkind) not
]

{ #category : #'accessing structure variables' }
COMVarDesc >> lpstrSchema [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_LPSTRSCHEMA) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
COMVarDesc >> lpstrSchema: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_LPSTRSCHEMA put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
COMVarDesc >> lpvarValue [

	self hasValueToRead ifFalse: [ 
		self error:
			'To use the content of this value in this kind of var may lead to segmentation fault' ].
	"This method was automatically generated"
	^ Win32Variant fromHandle: (handle pointerAt: OFFSET_LPVARVALUE)
]

{ #category : #'accessing structure variables' }
COMVarDesc >> lpvarValue: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_LPVARVALUE put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
COMVarDesc >> memid [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_MEMID
]

{ #category : #'accessing structure variables' }
COMVarDesc >> memid: anObject [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_MEMID put: anObject
]

{ #category : #'accessing structure variables' }
COMVarDesc >> varkind [
	"This method was automatically generated"
	^COMVarKind fromInteger: (handle unsignedLongAt: OFFSET_VARKIND)
]

{ #category : #'accessing structure variables' }
COMVarDesc >> varkind: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_VARKIND put: anObject value
]

{ #category : #'accessing structure variables' }
COMVarDesc >> wVarFlags [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_WVARFLAGS
]

{ #category : #'accessing structure variables' }
COMVarDesc >> wVarFlags: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_WVARFLAGS put: anObject
]
