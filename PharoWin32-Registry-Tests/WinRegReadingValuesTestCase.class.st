Class {
	#name : #WinRegReadingValuesTestCase,
	#superclass : #TestCase,
	#pools : [
		'WinRegTypes'
	],
	#category : #'PharoWin32-Registry-Tests'
}

{ #category : #tests }
WinRegReadingValuesTestCase >> testReadingBynary [
	| key editFlags |
	key := WinRegRootEntry HKEY_CLASSES_ROOT \ 'AudioCD'.

	editFlags := key valueNamed: 'EditFlags'.
	
	self assert: editFlags value equals: #[02 00 16 00]
]

{ #category : #tests }
WinRegReadingValuesTestCase >> testReadingDWORD [
	| key editFlags |
	key := WinRegRootEntry HKEY_CLASSES_ROOT \ 'mscfile'.

	editFlags := key valueNamed: 'EditFlags'.
	
	self assert: editFlags value equals: 1048576
]

{ #category : #tests }
WinRegReadingValuesTestCase >> testReadingStringValue [
	| key |
	key := WinRegRootEntry HKEY_CLASSES_ROOT \ 'InternetExplorer.Application' \ 'CLSID'.

	self assert: (key valueNamed: '') value equals: '{0002DF01-0000-0000-C000-000000000046}'
]

{ #category : #tests }
WinRegReadingValuesTestCase >> testReadingStringWithPlaceholders [
	| key tmp temp |
	key := WinRegRootEntry HKEY_CURRENT_USER / 'Environment' .

	tmp := key valueNamed: 'TMP'.
	temp := key valueNamed: 'TEMP'.
	
	self assert: tmp value equals: temp value
]
