Class {
	#name : #COMIdlDesc,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_DWRESERVED',
		'OFFSET_WIDLFLAGS'
	],
	#pools : [
		'COMTypes'
	],
	#category : 'PharoCOM-Types'
}

{ #category : #'as yet unclassified' }
COMIdlDesc class >> fieldsDesc [
	"
		self rebuildFieldAccessors.
	"

	^ #(
    ULONG dwReserved;
    ushort wIDLFlags;
	)
]

{ #category : #'accessing structure variables' }
COMIdlDesc >> dwReserved [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_DWRESERVED
]

{ #category : #'accessing structure variables' }
COMIdlDesc >> dwReserved: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_DWRESERVED put: anObject
]

{ #category : #'accessing structure variables' }
COMIdlDesc >> wIDLFlags [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_WIDLFLAGS
]

{ #category : #'accessing structure variables' }
COMIdlDesc >> wIDLFlags: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_WIDLFLAGS put: anObject
]
