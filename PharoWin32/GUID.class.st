Class {
	#name : #GUID,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_DATA1',
		'OFFSET_DATA2',
		'OFFSET_DATA3',
		'OFFSET_DATA4'
	],
	#pools : [
		'Win32Types'
	],
	#category : #'PharoWin32-Objects'
}

{ #category : #copying }
GUID class >> copy: other [
	| guid |
	guid := self externalNew autoRelease; yourself.
	
	1 to: self byteSize do:[:i |
		guid getHandle unsignedByteAt: i put: (other getHandle unsignedByteAt: i)	].
	^ guid.
]

{ #category : #'field definition' }
GUID class >> fieldsDesc [ 
	"
	self rebuildFieldAccessors
	"
	^ #(
		DWORD data1;
		WORD  data2;
		WORD  data3;
		Byte8  data4;
	)
]

{ #category : #'instance creation' }
GUID class >> fromString: aString [
	| guid |
	guid := self externalNew autoRelease; yourself.
	
	Ole32Lib uniqueInstance ffiFillCLSID: guid from: aString asWin32WideString.
	^ guid.
]

{ #category : #'instance creation' }
GUID class >> nullGuid [
	^ self fromString: '{00000000-0000-0000-0000-000000000000}'
]

{ #category : #converting }
GUID >> asString [
	^ String
		streamContents: [ :s | 
			s
				nextPut: ${;
				nextPutAll: (self pad: self data1 to: 8);
				nextPut: $-;
				nextPutAll: (self pad: self data2 to: 4);
				nextPut: $-;
				nextPutAll: (self pad: self data3 to: 4);
				nextPut: $-;
				nextPutAll: (self pad: (self data4 at:1) to: 2);
				nextPutAll: (self pad: (self data4 at:2) to: 2);
				nextPut: $-.
				3 to: 8 do: [ :idx | s nextPutAll: (self pad: (self data4 at:idx) to: 2)].
				s nextPut: $}.
		]
]

{ #category : #copying }
GUID >> copy [
	^ self class copy: self
]

{ #category : #'accessing structure variables' }
GUID >> data1 [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_DATA1
]

{ #category : #'accessing structure variables' }
GUID >> data1: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_DATA1 put: anObject
]

{ #category : #'accessing structure variables' }
GUID >> data2 [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_DATA2
]

{ #category : #'accessing structure variables' }
GUID >> data2: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_DATA2 put: anObject
]

{ #category : #'accessing structure variables' }
GUID >> data3 [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_DATA3
]

{ #category : #'accessing structure variables' }
GUID >> data3: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_DATA3 put: anObject
]

{ #category : #'accessing structure variables' }
GUID >> data4 [
	"This method was automatically generated"
	^(FFITypeArray ofType: FFIUInt8 size: 8) fromHandle: (handle copyFrom: OFFSET_DATA4 to: OFFSET_DATA4 + 7)
]

{ #category : #'accessing structure variables' }
GUID >> data4: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_DATA4 to: OFFSET_DATA4 + 7 with: anObject getHandle startingAt: 1
]

{ #category : #printing }
GUID >> pad: aNumber to: digits [.
	^ (('0' repeat: digits) , (aNumber printStringBase: 16)) last: digits.
]

{ #category : #printing }
GUID >> printOn: aStream [
	aStream
		nextPutAll: 'GUID (';
		nextPutAll: self asString;
		nextPut: $)
]
