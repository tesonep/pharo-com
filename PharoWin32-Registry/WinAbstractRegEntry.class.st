"
I represent an abstract entry in the registry. 
I implement the common behaviour of the entries.
"
Class {
	#name : #WinAbstractRegEntry,
	#superclass : #Object,
	#instVars : [
		'handle',
		'values',
		'subKeyCount',
		'subKeyNameMax',
		'valuesCount',
		'valueNameMax',
		'valueDataMax',
		'subKeys'
	],
	#pools : [
		'WinRegTypes'
	],
	#category : #'PharoWin32-Registry'
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

{ #category : #'private-open-closing' }
WinAbstractRegEntry >> ensureClose [
	self subclassResponsibility
]

{ #category : #'private-open-closing' }
WinAbstractRegEntry >> ensureOpen [
	self subclassResponsibility
]

{ #category : #'private-operations' }
WinAbstractRegEntry >> fillSubKeys [
	self runWhileOpen: [  
		self queryInfo.
		subKeys := OrderedCollection new: subKeyCount.
				
		0 to: (subKeyCount - 1) do:[:index |
			subKeys add: (self querySubKeyIndex: index).
		]
	].
]

{ #category : #'private-operations' }
WinAbstractRegEntry >> fillValues [
	self runWhileOpen: [  
		self queryInfo.
		values := OrderedCollection new: valuesCount.
		
		0 to: (valuesCount - 1) do:[:index |
			values add: (self queryValueIndex: index).
		]
	].
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

{ #category : #'private-operations' }
WinAbstractRegEntry >> queryInfo [
	| returnCode subKeyCountHolder valuesCountHolder subKeyNameMaxHolder valueNameMaxHolder valueDataMaxHolder |
	
	subKeyCountHolder := LPDWORD new.
	subKeyNameMaxHolder := LPDWORD new.
	
	valuesCountHolder := LPDWORD new.
	valueNameMaxHolder := LPDWORD new.
	valueDataMaxHolder := LPDWORD new.

	returnCode := AdvApi32Lib uniqueInstance
		ffiRegQueryInfoKey: self handle
		keyClassNameHolder: FFIExternalObject null
		keyClassNameLengthHolder: NULL_LPDWORD
		reserved: NULL_LPDWORD
		subKeyCountHolder: subKeyCountHolder
		subKeyNameMaxHolder: subKeyNameMaxHolder
		subKeyClassMaxHolder: NULL_LPDWORD
		valuesCountHolder: valuesCountHolder
		valueNameMaxHolder: valueNameMaxHolder
		valueDataMaxHolder: valueDataMaxHolder
		securityDescriptorSizeHolder: NULL_LPDWORD
		lastWriteTimeHolder: nil.

	returnCode ~= 0
		ifTrue: [ Kernel32Lib uniqueInstance reportError: returnCode ].
	
	subKeyCount := subKeyCountHolder value.
	subKeyNameMax := subKeyNameMaxHolder value.
	
	valuesCount := valuesCountHolder value.
	valueNameMax := valueNameMaxHolder value.
	valueDataMax := valueDataMaxHolder value.

]

{ #category : #'private-operations' }
WinAbstractRegEntry >> querySubKeyIndex: index [
	| returnCode nameSizeHolder subKeyName |
	
	nameSizeHolder := LPDWORD new.
	nameSizeHolder value: subKeyNameMax + 1.
	
	subKeyName := Win32WideString new: subKeyNameMax.
	
	returnCode  := AdvApi32Lib uniqueInstance
		ffiRegEnumKey: self handle
		index:  index 
		nameHolder: subKeyName 
		nameSizeHolder:  nameSizeHolder
		reserved:  NULL_LPDWORD
		classNameHolder:  FFIExternalObject null
		classLengthHolder:  NULL_LPDWORD
		lastWriteTime: nil.
		
	(returnCode ~= 0) ifTrue:[ Kernel32Lib uniqueInstance reportError: returnCode ].
		
	^ WinRegEntry new
		parent: self;
		subKey: subKeyName asString;
		yourself
]

{ #category : #'private-operations' }
WinAbstractRegEntry >> queryValueIndex: index [
	| returnCode nameSizeHolder valueName typeHolder valueData valueDataLength|
	
	nameSizeHolder := LPDWORD new.
	nameSizeHolder value: valueNameMax + 1.
	
	valueName := Win32WideString new: valueNameMax + 1.
	typeHolder := LPDWORD new.
	
	valueData := ByteArray new: valueDataMax.
	valueDataLength := LPDWORD new.
	valueDataLength value: valueDataMax.
	
	returnCode  := AdvApi32Lib uniqueInstance
		ffiRegEnumValueKey: self handle
		index: index
		nameHolder: valueName
		nameSizeHolder: nameSizeHolder
		reserved: NULL_LPDWORD
		typeHolder: typeHolder
		dataHolder: valueData
		dataLengthHolder: valueDataLength.
		
	(returnCode ~= 0) ifTrue:[ Kernel32Lib uniqueInstance reportError: returnCode ].
	
	^ WinRegValue new 
		name: valueName asString;
		type: typeHolder value;
		convertData:  (valueData first: valueDataLength value);
		yourself.
]

{ #category : #operations }
WinAbstractRegEntry >> read [
	self fillSubKeys.
	self fillValues.
]

{ #category : #'private-open-closing' }
WinAbstractRegEntry >> runWhileOpen: aBlock [
	self ensureOpen.
	[ aBlock value ]
		ensure: [ self ensureClose ]
]

{ #category : #accessing }
WinAbstractRegEntry >> subKeys [
	^ subKeys ifNil:[self fillSubKeys. subKeys].
]

{ #category : #accessing }
WinAbstractRegEntry >> valueNamed: aName [
	^ self values detect: [ :e | e name = aName ]
]

{ #category : #accessing }
WinAbstractRegEntry >> values [
	^ values  ifNil: [ self fillValues. values ]
]
