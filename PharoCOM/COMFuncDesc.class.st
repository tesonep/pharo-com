Class {
	#name : #COMFuncDesc,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_CALLCONV',
		'OFFSET_CPARAMS',
		'OFFSET_CPARAMSOPT',
		'OFFSET_CSCODES',
		'OFFSET_ELEMDESCFUNC',
		'OFFSET_FUNCKIND',
		'OFFSET_INVKIND',
		'OFFSET_LPRGELEMDESCPARAM',
		'OFFSET_LPRGSCODE',
		'OFFSET_MEMID',
		'OFFSET_OVFT',
		'OFFSET_WFUNCFLAGS'
	],
	#pools : [
		'COMTypes'
	],
	#category : 'PharoCOM-Types'
}

{ #category : #'field definition' }
COMFuncDesc class >> fieldsDesc [
	"
		self rebuildFieldAccessors.
	"

	^ #(
    MEMBERID memid;
    SCODE *lprgscode;
    ELEMDESC *lprgelemdescParam;
    FUNCKIND funckind;
    INVOKEKIND invkind;
    CALLCONV callconv;
    SHORT cParams;
    SHORT cParamsOpt;
    SHORT oVft;
    SHORT cScodes;
    ELEMDESC elemdescFunc;
    WORD wFuncFlags;
	)
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> cParams [
	"This method was automatically generated"
	^handle signedShortAt: OFFSET_CPARAMS
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> cParams: anObject [
	"This method was automatically generated"
	handle signedShortAt: OFFSET_CPARAMS put: anObject
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> cParamsOpt [
	"This method was automatically generated"
	^handle signedShortAt: OFFSET_CPARAMSOPT
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> cParamsOpt: anObject [
	"This method was automatically generated"
	handle signedShortAt: OFFSET_CPARAMSOPT put: anObject
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> cScodes [
	"This method was automatically generated"
	^handle signedShortAt: OFFSET_CSCODES
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> cScodes: anObject [
	"This method was automatically generated"
	handle signedShortAt: OFFSET_CSCODES put: anObject
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> callconv [
	"This method was automatically generated"
	^COMCallConv fromInteger: (handle unsignedLongAt: OFFSET_CALLCONV)
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> callconv: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_CALLCONV put: anObject value
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> elemdescFunc [
	"This method was automatically generated"
	^ COMElemDesc fromHandle: (handle referenceStructAt: OFFSET_ELEMDESCFUNC length: COMElemDesc byteSize)
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> elemdescFunc: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_ELEMDESCFUNC put: anObject getHandle length: COMElemDesc byteSize
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> funckind [
	"This method was automatically generated"
	^COMFuncKind fromInteger: (handle unsignedLongAt: OFFSET_FUNCKIND)
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> funckind: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FUNCKIND put: anObject value
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> invkind [
	"This method was automatically generated"
	^COMInvokeKind fromInteger: (handle unsignedLongAt: OFFSET_INVKIND)
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> invkind: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_INVKIND put: anObject value
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> lprgelemdescParam [
	"This method was automatically generated"
	^COMElemDesc fromHandle: (handle pointerAt: OFFSET_LPRGELEMDESCPARAM)
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> lprgelemdescParam: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_LPRGELEMDESCPARAM put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> lprgscode [
	"This method was automatically generated"
	^ExternalData 
		fromHandle: (handle platformLongAt: OFFSET_LPRGSCODE)
		type: FFIArchitecture forCurrentArchitecture externalLongType asPointerType
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> lprgscode: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_LPRGSCODE put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> memid [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_MEMID
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> memid: anObject [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_MEMID put: anObject
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> oVft [
	"This method was automatically generated"
	^handle signedShortAt: OFFSET_OVFT
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> oVft: anObject [
	"This method was automatically generated"
	handle signedShortAt: OFFSET_OVFT put: anObject
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> paramTypes [
	^ FFIExternalArray fromHandle: self lprgelemdescParam getHandle type: 'COMElemDesc' size: self cParams.
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> wFuncFlags [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_WFUNCFLAGS
]

{ #category : #'accessing structure variables' }
COMFuncDesc >> wFuncFlags: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_WFUNCFLAGS put: anObject
]
