Class {
	#name : #DGBEnumerateModules,
	#superclass : #DGBCallback,
	#pools : [
		'DBGHelpTypes'
	],
	#category : #'PharoCOM-DBGHelp'
}

{ #category : #'instance creation' }
DGBEnumerateModules class >> fnSpec [
	^#(BOOL (char*  ModuleName, DWORD64 BaseOfDll,  void* userContext))
]
