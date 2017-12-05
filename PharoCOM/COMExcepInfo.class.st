Class {
	#name : #COMExcepInfo,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_BSTRDESCRIPTION',
		'OFFSET_BSTRHELPFILE',
		'OFFSET_BSTRSOURCE',
		'OFFSET_DWHELPCONTEXT',
		'OFFSET_PFNDEFERREDFILLIN',
		'OFFSET_PVRESERVED',
		'OFFSET_SCODE',
		'OFFSET_WCODE',
		'OFFSET_WRESERVED'
	],
	#pools : [
		'COMTypes'
	],
	#category : 'PharoCOM-Types'
}

{ #category : #'as yet unclassified' }
COMExcepInfo class >> fieldsDesc [
"
		self rebuildFieldAccessors.
"

	^ #(
    WORD wCode;
    WORD wReserved;
    BSTR bstrSource;
    BSTR bstrDescription;
    BSTR bstrHelpFile;
    DWORD dwHelpContext;
    ULONG* pvReserved;
    ULONG* pfnDeferredFillIn;
    SCODE scode;
	)
]

{ #category : #'accessing structure variables' }
COMExcepInfo >> bstrDescription [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_BSTRDESCRIPTION) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
COMExcepInfo >> bstrDescription: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_BSTRDESCRIPTION put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
COMExcepInfo >> bstrHelpFile [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_BSTRHELPFILE) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
COMExcepInfo >> bstrHelpFile: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_BSTRHELPFILE put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
COMExcepInfo >> bstrSource [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_BSTRSOURCE) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
COMExcepInfo >> bstrSource: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_BSTRSOURCE put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
COMExcepInfo >> dwHelpContext [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_DWHELPCONTEXT
]

{ #category : #'accessing structure variables' }
COMExcepInfo >> dwHelpContext: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_DWHELPCONTEXT put: anObject
]

{ #category : #'accessing structure variables' }
COMExcepInfo >> pfnDeferredFillIn [
	"This method was automatically generated"
	^ExternalData 
		fromHandle: (handle platformUnsignedLongAt: OFFSET_PFNDEFERREDFILLIN)
		type: FFIArchitecture forCurrentArchitecture externalULongType asPointerType
]

{ #category : #'accessing structure variables' }
COMExcepInfo >> pfnDeferredFillIn: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PFNDEFERREDFILLIN put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
COMExcepInfo >> pvReserved [
	"This method was automatically generated"
	^ExternalData 
		fromHandle: (handle platformUnsignedLongAt: OFFSET_PVRESERVED)
		type: FFIArchitecture forCurrentArchitecture externalULongType asPointerType
]

{ #category : #'accessing structure variables' }
COMExcepInfo >> pvReserved: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PVRESERVED put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
COMExcepInfo >> scode [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_SCODE
]

{ #category : #'accessing structure variables' }
COMExcepInfo >> scode: anObject [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_SCODE put: anObject
]

{ #category : #'accessing structure variables' }
COMExcepInfo >> wCode [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_WCODE
]

{ #category : #'accessing structure variables' }
COMExcepInfo >> wCode: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_WCODE put: anObject
]

{ #category : #'accessing structure variables' }
COMExcepInfo >> wReserved [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_WRESERVED
]

{ #category : #'accessing structure variables' }
COMExcepInfo >> wReserved: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_WRESERVED put: anObject
]
