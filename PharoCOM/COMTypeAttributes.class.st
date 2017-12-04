Class {
	#name : #COMTypeAttributes,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_CBALIGNMENT',
		'OFFSET_CBSIZEINSTANCE',
		'OFFSET_CBSIZEVFT',
		'OFFSET_CFUNCS',
		'OFFSET_CIMPLTYPES',
		'OFFSET_CVARS',
		'OFFSET_DWRESERVED',
		'OFFSET_GUID',
		'OFFSET_IDLDESCTYPE',
		'OFFSET_LCID',
		'OFFSET_LPSTRSCHEMA',
		'OFFSET_MEMIDCONSTRUCTOR',
		'OFFSET_MEMIDDESTRUCTOR',
		'OFFSET_TDESCALIAS',
		'OFFSET_TYPEKIND',
		'OFFSET_WMAJORVERNUM',
		'OFFSET_WMINORVERNUM',
		'OFFSET_WTYPEFLAGS'
	],
	#pools : [
		'COMTypes'
	],
	#category : 'PharoCOM-Types'
}

{ #category : #'as yet unclassified' }
COMTypeAttributes class >> fieldsDesc [
	"
		self rebuildFieldAccessors.
	"

	^ #(
    GUID guid;
    LCID lcid;
    DWORD dwReserved;
    MEMBERID memidConstructor;
    MEMBERID memidDestructor;
    LPOLESTR lpstrSchema;
    ULONG cbSizeInstance;
    TYPEKIND typekind;
    WORD cFuncs;
    WORD cVars;
    WORD cImplTypes;
    WORD cbSizeVft;
    WORD cbAlignment;
    WORD wTypeFlags;
    WORD wMajorVerNum;
    WORD wMinorVerNum;
    TYPEDESC tdescAlias;
    IDLDESC idldescType;	
	)

]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> cFuncs [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_CFUNCS
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> cFuncs: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_CFUNCS put: anObject
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> cImplTypes [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_CIMPLTYPES
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> cImplTypes: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_CIMPLTYPES put: anObject
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> cVars [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_CVARS
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> cVars: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_CVARS put: anObject
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> cbAlignment [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_CBALIGNMENT
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> cbAlignment: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_CBALIGNMENT put: anObject
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> cbSizeInstance [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_CBSIZEINSTANCE
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> cbSizeInstance: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_CBSIZEINSTANCE put: anObject
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> cbSizeVft [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_CBSIZEVFT
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> cbSizeVft: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_CBSIZEVFT put: anObject
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> dwReserved [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_DWRESERVED
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> dwReserved: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_DWRESERVED put: anObject
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> guid [
	"This method was automatically generated"
	^ GUID fromHandle: (handle referenceStructAt: OFFSET_GUID length: GUID byteSize)
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> guid: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_GUID put: anObject getHandle length: GUID byteSize
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> idldescType [
	"This method was automatically generated"
	^ COMIdlDesc fromHandle: (handle referenceStructAt: OFFSET_IDLDESCTYPE length: COMIdlDesc byteSize)
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> idldescType: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_IDLDESCTYPE put: anObject getHandle length: COMIdlDesc byteSize
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> lcid [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_LCID
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> lcid: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_LCID put: anObject
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> lpstrSchema [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_LPSTRSCHEMA) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> lpstrSchema: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_LPSTRSCHEMA put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> memidConstructor [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_MEMIDCONSTRUCTOR
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> memidConstructor: anObject [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_MEMIDCONSTRUCTOR put: anObject
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> memidDestructor [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_MEMIDDESTRUCTOR
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> memidDestructor: anObject [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_MEMIDDESTRUCTOR put: anObject
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> tdescAlias [
	"This method was automatically generated"
	^ COMTypeDesc fromHandle: (handle referenceStructAt: OFFSET_TDESCALIAS length: COMTypeDesc byteSize)
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> tdescAlias: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_TDESCALIAS put: anObject getHandle length: COMTypeDesc byteSize
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> typekind [
	"This method was automatically generated"
	^COMTypeKind fromInteger: (handle unsignedLongAt: OFFSET_TYPEKIND)
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> typekind: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPEKIND put: anObject value
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> wMajorVerNum [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_WMAJORVERNUM
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> wMajorVerNum: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_WMAJORVERNUM put: anObject
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> wMinorVerNum [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_WMINORVERNUM
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> wMinorVerNum: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_WMINORVERNUM put: anObject
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> wTypeFlags [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_WTYPEFLAGS
]

{ #category : #'accessing structure variables' }
COMTypeAttributes >> wTypeFlags: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_WTYPEFLAGS put: anObject
]
