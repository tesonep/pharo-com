Class {
	#name : #Win32Variant,
	#superclass : #FFIExternalStructure,
	#traits : 'TWinErrorChecker',
	#classTraits : 'TWinErrorChecker classTrait',
	#classVars : [
		'OFFSET_DATA',
		'OFFSET_VT',
		'OFFSET_WRESERVED1',
		'OFFSET_WRESERVED2',
		'OFFSET_WRESERVED3',
		'PointerType',
		'TypeMapping'
	],
	#pools : [
		'COMTypes'
	],
	#category : #'PharoCOM-Variant'
}

{ #category : #'as yet unclassified' }
Win32Variant class >> fieldsDesc [ 
	"
	self rebuildFieldAccessors
	"
	^ #(
		VARTYPE vt;
		WORD  wReserved1;
		WORD  wReserved2;
		WORD  wReserved3;
		Byte8 data;
	)
]

{ #category : #'class initialization' }
Win32Variant class >> initialize [
	self initializeTypeMapping.
]

{ #category : #initialization }
Win32Variant class >> initializeTypeMapping [
	"	self initializeTypeMapping. "

	PointerType := 26.

	TypeMapping := ({
		(Win32VariantNull new: #NULL as: 1).
		(Win32VariantUnimplementedType new: #int16 as: 2).
		(Win32VariantInt32 new: #int32 as: 3).
		(Win32VariantUnimplementedType new: #float as: 4).
		(Win32VariantDouble new: #double as: 5).
		(Win32VariantUnimplementedType new: #CURRENCY as: 6).
		(Win32VariantDate new: #DATE as: 7).
		(Win32VariantBSTRString new: #BSTRString as: 8).
		(Win32VariantCOMInstance new: #COMDispatchInstance as: 9).
		(Win32VariantUnimplementedType new: #ERROR as: 10).
		(Win32VariantBool new: #BOOL as: 11).
		(Win32VariantType new: #Win32Variant as: 12).
		(Win32VariantCOMInstance new: #COMUnknownInstance as: 13).
		(Win32VariantDecimal new: #DECIMAL as: 14).
		(Win32VariantUnimplementedType new: #byte as: 16).
		(Win32VariantUnimplementedType new: #ubyte as: 17).
		(Win32VariantUnimplementedType new: #uint16 as: 18).
		(Win32VariantUnimplementedType new: #uint32 as: 19).
		(Win32VariantUnimplementedType new: #longlong as: 20).
		(Win32VariantUnimplementedType new: #ulonglong as: 21).
		(Win32VariantUnimplementedType new: #int as: 22).
		(Win32VariantUnimplementedType new: #uint as: 23).
		(Win32VariantVoid newAs: 24).
		(Win32VariantUnimplementedType new: #HRESULT as: 25).
		(Win32VariantUnimplementedType new: #PTR as: 26).
		(Win32VariantUnimplementedType new: #SAFEARRAY as: 27).
		(Win32VariantUnimplementedType new: #CARRAY as: 28).
		(Win32VariantUserDefined new: #USERDEFINED as: 29).
		(Win32VariantUnimplementedType new: #String as: 30).
		(Win32VariantUnimplementedType new: #Win32WideString as: 31).
		(Win32VariantUnimplementedType new: #RECORD as: 32).
		(Win32VariantUnimplementedType new: #GUID as: 72)
	} collect: [ :e | e typeNumber -> e ]) asDictionary
]

{ #category : #types }
Win32Variant class >> isPointer: anInteger [ 
	^ anInteger = PointerType
]

{ #category : #types }
Win32Variant class >> typeFor: anInteger [ 
	^ TypeMapping at: anInteger
]

{ #category : #accessing }
Win32Variant >> clear [
	" Clears the variant after being used in COM calls"
	| returnCode |
	returnCode := OleAut32Lib uniqueInstance ffiVariantClear: self getHandleAsExternalAddress .
	self reportErrorIfNoZero: returnCode.
]

{ #category : #accessing }
Win32Variant >> contentType [
	^ self class typeFor: self vt.
]

{ #category : #'accessing structure variables' }
Win32Variant >> data [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIUInt8 size: 8) fromHandle: (handle copyFrom: OFFSET_DATA to: OFFSET_DATA + 7)
]

{ #category : #'accessing structure variables' }
Win32Variant >> data: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_DATA to: OFFSET_DATA + 7 with: anObject getHandle startingAt: 1
]

{ #category : #'accessing - private' }
Win32Variant >> getHandleAsExternalAddress [
	"This ugly ugly method is here because the FFI primitive only accepts ExternalAddress as pointers, FFIExternalStructureReferenceHandle that is polymorphic is not accepted."

	(handle isKindOf: FFIExternalStructureReferenceHandle)
		ifTrue: [ ^ handle getHandle + (handle instVarNamed: #startOffset) ].
	^ handle
]

{ #category : #initialization }
Win32Variant >> init [
	" Inits the variant to be used in COM calls"
	OleAut32Lib uniqueInstance ffiVariantInit: self getHandleAsExternalAddress.
]

{ #category : #printing }
Win32Variant >> printOn: aStream [
	aStream nextPutAll: self class name; nextPutAll: ' ( '.
	aStream nextPutAll: self contentType typeName ; nextPutAll: '  '.
	aStream nextPutAll: self read printString; nextPutAll: ' )'.
]

{ #category : #accessing }
Win32Variant >> rawData [
	^ FFIExternalStructureReferenceHandle handle: self getHandle offset: OFFSET_DATA
]

{ #category : #accessing }
Win32Variant >> read [
	^ self contentType readFrom: self.
]

{ #category : #'accessing structure variables' }
Win32Variant >> vt [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_VT
]

{ #category : #'accessing structure variables' }
Win32Variant >> vt: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_VT put: anObject
]

{ #category : #'accessing structure variables' }
Win32Variant >> wReserved1 [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_WRESERVED1
]

{ #category : #'accessing structure variables' }
Win32Variant >> wReserved1: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_WRESERVED1 put: anObject
]

{ #category : #'accessing structure variables' }
Win32Variant >> wReserved2 [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_WRESERVED2
]

{ #category : #'accessing structure variables' }
Win32Variant >> wReserved2: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_WRESERVED2 put: anObject
]

{ #category : #'accessing structure variables' }
Win32Variant >> wReserved3 [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_WRESERVED3
]

{ #category : #'accessing structure variables' }
Win32Variant >> wReserved3: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_WRESERVED3 put: anObject
]

{ #category : #accessing }
Win32Variant >> write: aValue [
	self contentType write: aValue to: self.
]
