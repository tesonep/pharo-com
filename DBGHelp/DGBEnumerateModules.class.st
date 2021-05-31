Class {
	#name : #DGBEnumerateModules,
	#superclass : #DGBCallback,
	#pools : [
		'DBGHelpTypes'
	],
	#category : #DBGHelp
}

{ #category : #'instance creation' }
DGBEnumerateModules class >> fnSpec [
	^#(BOOL (char*  ModuleName, DWORD64 BaseOfDll,  void* userContext))
]
