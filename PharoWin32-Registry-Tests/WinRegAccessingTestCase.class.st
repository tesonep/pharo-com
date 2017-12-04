Class {
	#name : #WinRegAccessingTestCase,
	#superclass : #TestCase,
	#pools : [
		'WinRegTypes'
	],
	#category : #'PharoWin32-Registry-Tests'
}

{ #category : #tests }
WinRegAccessingTestCase >> testQueryingRoot [
	| hkey valueCount subKeyCount |
	
	hkey := HKEY_CLASSES_ROOT.
	
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
	
	hkey :=  HKEY_LOCAL_MACHINE\'SOFTWARE'\'Microsoft'\'Internet Explorer'.
	
	hkey ensureOpen.
	hkey queryInfo.
	hkey ensureClose.
	
	valueCount := hkey instVarNamed: #valuesCount.
	subKeyCount := hkey instVarNamed: #subKeyCount.
	
	self assert:  valueCount >  0.
	self assert:  subKeyCount >  0.	
]
