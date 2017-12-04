Class {
	#name : #WinRegAccessingTestCase,
	#superclass : #TestCase,
	#pools : [
		'WinRegTypes'
	],
	#category : #'PharoWin32-Registry-Tests'
}

{ #category : #tests }
WinRegAccessingTestCase >> testAccessingSubKeysRoot [
	| hkey valueCount subKeyCount subkeys |
	
	hkey := WinRegRootEntry HKEY_CLASSES_ROOT.
	
	hkey ensureOpen.
	hkey queryInfo.
	hkey ensureClose.	
	
	subkeys := hkey subKeys.
		
	valueCount := hkey instVarNamed: #valuesCount.
	subKeyCount := hkey instVarNamed: #subKeyCount.
	
	self assert:  subKeyCount equals:  subkeys size.

]

{ #category : #tests }
WinRegAccessingTestCase >> testAccessingValuesNamesSubKey [
	| hkey values |
	hkey := WinRegRootEntry HKEY_LOCAL_MACHINE \ 'SOFTWARE' \ 'Microsoft' \ 'Internet Explorer'.
	values := hkey values.
	values
		detect: [ :e | e name = 'Version' ]
		ifNone: [ self fail: 'The expected value ''Version'' was not found' ]
]

{ #category : #tests }
WinRegAccessingTestCase >> testAccessingValuesRoot [
	| hkey valueCount subKeyCount values |
	
	hkey := WinRegRootEntry HKEY_CLASSES_ROOT.
	
	hkey ensureOpen.
	hkey queryInfo.
	hkey ensureClose.	
	
	values := hkey values.
		
	valueCount := hkey instVarNamed: #valuesCount.
	subKeyCount := hkey instVarNamed: #subKeyCount.
	
	self assert:  valueCount equals:  values size.

]

{ #category : #tests }
WinRegAccessingTestCase >> testAccessingValuesSubKey [
	| hkey valueCount subKeyCount values |
	
	hkey := WinRegRootEntry HKEY_LOCAL_MACHINE \ 'SOFTWARE' \ 'Microsoft' \ 'Internet Explorer'.
	
	hkey ensureOpen.
	hkey queryInfo.
	hkey ensureClose.
	
	values := hkey values.
			
	valueCount := hkey instVarNamed: #valuesCount.
	subKeyCount := hkey instVarNamed: #subKeyCount.
	
	self assert:  valueCount equals:  values size.

]

{ #category : #tests }
WinRegAccessingTestCase >> testQueryingRoot [
	| hkey valueCount subKeyCount |
	
	hkey := WinRegRootEntry HKEY_CLASSES_ROOT.
	
	hkey ensureOpen.
	hkey queryInfo.
	hkey ensureClose.
	
	valueCount := hkey instVarNamed: #valuesCount.
	subKeyCount := hkey instVarNamed: #subKeyCount.
	
	self assert:  valueCount equals:  0.
	self assert:  subKeyCount >  0.	
]

{ #category : #tests }
WinRegAccessingTestCase >> testQueryingSubKey [
	| hkey valueCount subKeyCount |
	
	hkey :=  WinRegRootEntry HKEY_LOCAL_MACHINE \ 'SOFTWARE' \ 'Microsoft' \ 'Internet Explorer'.
	
	hkey ensureOpen.
	hkey queryInfo.
	hkey ensureClose.
	
	valueCount := hkey instVarNamed: #valuesCount.
	subKeyCount := hkey instVarNamed: #subKeyCount.
	
	self assert:  valueCount >  0.
	self assert:  subKeyCount >  0.	
]
