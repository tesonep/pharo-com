Class {
	#name : #DGBEnumerateSymbols,
	#superclass : #DGBCallback,
	#pools : [
		'DBGHelpTypes'
	],
	#category : #'PharoCOM-DBGHelp'
}

{ #category : #'instance creation' }
DGBEnumerateSymbols class >> fnSpec [
	^#(BOOL (SYMBOLINFO* pSymInfo, ulong symbolSize, void* userContext))
]
