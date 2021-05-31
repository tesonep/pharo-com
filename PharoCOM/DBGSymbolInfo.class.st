Class {
	#name : #DBGSymbolInfo,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_ADDRESS',
		'OFFSET_FIRSTCHARACTEROFNAME',
		'OFFSET_FLAGS',
		'OFFSET_INDEX',
		'OFFSET_MAXNAMELEN',
		'OFFSET_MODBASE',
		'OFFSET_NAMELEN',
		'OFFSET_REGISTER',
		'OFFSET_RESERVED1',
		'OFFSET_RESERVED2',
		'OFFSET_SCOPE',
		'OFFSET_SIZE',
		'OFFSET_SIZEOFSTRUCT',
		'OFFSET_TAG',
		'OFFSET_TYPEINDEX',
		'OFFSET_VALUE'
	],
	#category : #'PharoCOM-DBGHelp'
}

{ #category : #'field definition' }
DBGSymbolInfo class >> fieldsDesc [
	"
		self rebuildFieldAccessors.
	"

	^ #(
   ulong   sizeOfStruct;
  ulong   typeIndex;
  ulonglong reserved1;
  ulonglong reserved2;
  ulong   index;
  ulong   size;
  ulonglong modBase;
  ulong   flags;
  ulonglong value;
  ulonglong address;
  ulong   register;
  ulong   scope;
  ulong   tag;
  ulong   nameLen;
  ulong   maxNameLen;
  char    firstCharacterOfName;
	)
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> address [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_ADDRESS
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> address: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_ADDRESS put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> firstCharacterOfName [
	"This method was automatically generated"
	^handle unsignedCharAt: OFFSET_FIRSTCHARACTEROFNAME
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> firstCharacterOfName: anObject [
	"This method was automatically generated"
	handle unsignedCharAt: OFFSET_FIRSTCHARACTEROFNAME put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> flags [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_FLAGS
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> flags: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_FLAGS put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> index [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_INDEX
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> index: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_INDEX put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> maxNameLen [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_MAXNAMELEN
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> maxNameLen: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_MAXNAMELEN put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> modBase [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_MODBASE
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> modBase: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_MODBASE put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> name [

	"This method was automatically generated"

	| stream |
	stream := WriteStream on: String new.
	OFFSET_FIRSTCHARACTEROFNAME to:
	OFFSET_FIRSTCHARACTEROFNAME + self nameLen - 1 do: [ :i | 
	stream nextPut: (handle unsignedCharAt: i) ].
	^ stream contents
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> nameLen [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_NAMELEN
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> nameLen: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_NAMELEN put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> register [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_REGISTER
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> register: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_REGISTER put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> reserved1 [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_RESERVED1
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> reserved1: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_RESERVED1 put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> reserved2 [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_RESERVED2
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> reserved2: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_RESERVED2 put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> scope [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_SCOPE
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> scope: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_SCOPE put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> size [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_SIZE
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> size: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_SIZE put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> sizeOfStruct [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_SIZEOFSTRUCT
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> sizeOfStruct: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_SIZEOFSTRUCT put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> tag [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_TAG
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> tag: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_TAG put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> typeIndex [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_TYPEINDEX
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> typeIndex: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_TYPEINDEX put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> value [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_VALUE
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> value: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_VALUE put: anObject
]
