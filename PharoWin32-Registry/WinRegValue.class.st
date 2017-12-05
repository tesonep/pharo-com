"
I represent a value from an entry in the windows registry.
As I have many different types, my data is only an array of bytes and it is interpreted later.
"
Class {
	#name : #WinRegValue,
	#superclass : #Object,
	#traits : 'TWinErrorChecker',
	#classTraits : 'TWinErrorChecker classTrait',
	#instVars : [
		'entry',
		'name',
		'type',
		'data'
	],
	#classVars : [
		'TypeMap'
	],
	#pools : [
		'WinRegTypes'
	],
	#category : #'PharoWin32-Registry'
}

{ #category : #'class initialization' }
WinRegValue class >> initialize [
"#define REG_NONE                    ( 0 )   // No value type
#define REG_SZ                      ( 1 )   // Unicode nul terminated string
#define REG_EXPAND_SZ               ( 2 )   // Unicode nul terminated string (with environment variable references)
#define REG_BINARY                  ( 3 )   // Free form binary
#define REG_DWORD                   ( 4 )   // 32-bit number
#define REG_DWORD_BIG_ENDIAN        ( 5 )   // 32-bit number
#define REG_LINK                    ( 6 )   // Symbolic Link (unicode)
#define REG_MULTI_SZ                ( 7 )   // Multiple Unicode strings
#define REG_RESOURCE_LIST           ( 8 )   // Resource list in the resource map
#define REG_FULL_RESOURCE_DESCRIPTOR ( 9 )  // Resource list in the hardware description
#define REG_RESOURCE_REQUIREMENTS_LIST ( 10 )
#define REG_QWORD                   ( 11 )  // 64-bit number
"

TypeMap := {  
	 0 -> #convertBytes:.
	 1 -> #convertWideString:.
	 2 -> #convertWideString:.
	 3 -> #convertBytes:.
	 4 -> #convertDWORD:.
	 5 -> #convertDWORD:.
	 6 -> #convertWideString:.
	 7 -> #convertBytes:.
	 8 -> #convertBytes:.
	 9 -> #convertBytes:.
	10 -> #convertBytes:.
	11 -> #convertQWORD:.
} asDictionary.
]

{ #category : #'converting values' }
WinRegValue >> convertBytes: byteArray [
	^ byteArray
]

{ #category : #'converting values' }
WinRegValue >> convertDWORD: byteArray [
	^ FFIUInt32 new basicHandle: byteArray at: 1
]

{ #category : #'converting values' }
WinRegValue >> convertData: byteArray [
	| convertMessage |
	
	convertMessage := TypeMap at: type.
	data := self perform: convertMessage with: byteArray.
	^ data 
]

{ #category : #'converting values' }
WinRegValue >> convertQWORD: byteArray [
	^ FFIUInt64 new basicHandle: byteArray at: 1
]

{ #category : #'converting values' }
WinRegValue >> convertWideString: byteArray [
	^ (Win32WideString fromByteArray: byteArray) asString
]

{ #category : #accessing }
WinRegValue >> data [
	^ data
]

{ #category : #accessing }
WinRegValue >> data: anObject [
	data := anObject
]

{ #category : #accessing }
WinRegValue >> entry [
	^ entry
]

{ #category : #accessing }
WinRegValue >> entry: anObject [
	entry := anObject
]

{ #category : #accessing }
WinRegValue >> name [
	^ name
]

{ #category : #accessing }
WinRegValue >> name: anObject [
	name := anObject
]

{ #category : #printing }
WinRegValue >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: name asString;
		nextPut: Character space;
		nextPut: $';
		nextPutAll: data printString;
		nextPut: $';		
		nextPut: $)
]

{ #category : #accessing }
WinRegValue >> type [
	^ type
]

{ #category : #accessing }
WinRegValue >> type: anObject [
	type := anObject
]

{ #category : #evaluating }
WinRegValue >> value [
	^ self data
]
