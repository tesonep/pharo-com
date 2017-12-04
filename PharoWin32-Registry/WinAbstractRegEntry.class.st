"
I represent an abstract entry in the registry. 
I implement the common behaviour of the entries.
"
Class {
	#name : #WinAbstractRegEntry,
	#superclass : #Object,
	#instVars : [
		'handle',
		'entries',
		'values',
		'subKeyCount',
		'subKeyNameMax',
		'valuesCount',
		'valueNameMax',
		'valueDataMax'
	],
	#pools : [
		'WinRegTypes'
	],
	#category : 'PharoWin32-Registry'
}

{ #category : #navigating }
WinAbstractRegEntry >> / aSubKey [
	^ self \ aSubKey
]

{ #category : #navigating }
WinAbstractRegEntry >> \ aSubKey [
	^ WinRegEntry new
		parent: self;
		subKey: aSubKey;
		yourself
]

{ #category : #private }
WinAbstractRegEntry >> ensureClose [
	self subclassResponsibility 
]

{ #category : #private }
WinAbstractRegEntry >> ensureOpen [
	self subclassResponsibility 
]

{ #category : #accessing }
WinAbstractRegEntry >> entries [
	^ entries ifNil: [ self fillEntries. entries ]
]

{ #category : #accessing }
WinAbstractRegEntry >> entries: anObject [
	entries := anObject
]

{ #category : #accessing }
WinAbstractRegEntry >> handle [
	^ handle
]

{ #category : #accessing }
WinAbstractRegEntry >> handle: anObject [
	handle := anObject
]

{ #category : #printing }
WinAbstractRegEntry >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: self keyName;
		nextPut: $)
]

{ #category : #private }
WinAbstractRegEntry >> queryInfo [
	| returnCode nullLPDWORD subKeyCountHolder valuesCountHolder subKeyNameMaxHolder valueNameMaxHolder valueDataMaxHolder |
	nullLPDWORD := FFIExternalObject null.
	
	subKeyCountHolder := LPDWORD new.
	subKeyNameMaxHolder := LPDWORD new.
	
	valuesCountHolder := LPDWORD new.
	valueNameMaxHolder := LPDWORD new.
	valueDataMaxHolder := LPDWORD new.

	returnCode := AdvApi32Lib uniqueInstance
		ffiRegQueryInfoKey: self handle
		keyClassNameHolder: FFIExternalObject null
		keyClassNameLengthHolder: nullLPDWORD
		reserved: nullLPDWORD
		subKeyCountHolder: subKeyCountHolder
		subKeyNameMaxHolder: subKeyNameMaxHolder
		subKeyClassMaxHolder: nullLPDWORD
		valuesCountHolder: valuesCountHolder
		valueNameMaxHolder: valueNameMaxHolder
		valueDataMaxHolder: valueDataMaxHolder
		securityDescriptorSizeHolder: nullLPDWORD
		lastWriteTimeHolder: nil.

	returnCode ~= 0
		ifTrue: [ Kernel32Lib uniqueInstance reportError: returnCode ].
	
	subKeyCount := subKeyCountHolder value.
	subKeyNameMax := subKeyNameMaxHolder value.
	
	valuesCount := valuesCountHolder value.
	valueNameMax := valueNameMaxHolder value.
	valueDataMax := valueDataMaxHolder value.


]

{ #category : #private }
WinAbstractRegEntry >> runWhileOpen: aBlock [
	self ensureOpen.
	[ aBlock value ]
		ensure: [ self ensureClose ]
]

{ #category : #accessing }
WinAbstractRegEntry >> values [
	^ values  ifNil: [ self fillValues. values ]
]

{ #category : #accessing }
WinAbstractRegEntry >> values: anObject [
	values := anObject
]
