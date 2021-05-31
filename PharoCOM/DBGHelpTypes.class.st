Class {
	#name : #DBGHelpTypes,
	#superclass : #SharedPool,
	#classVars : [
		'DWORD64',
		'SYMBOLINFO',
		'SYM_ENUMERATESYMBOLS_CALLBACK',
		'SYM_ENUMMODULES_CALLBACK64',
		'ULONG64'
	],
	#pools : [
		'Win32Types'
	],
	#category : #'PharoCOM-DBGHelp'
}

{ #category : #'class initialization' }
DBGHelpTypes class >> initialize [

	DWORD64 := #ulonglong.
	ULONG64 := #ulonglong.
	SYMBOLINFO := #DBGSymbolInfo.
	SYM_ENUMERATESYMBOLS_CALLBACK := #DGBEnumerateSymbols.
	SYM_ENUMMODULES_CALLBACK64 := #DGBEnumerateModules
]
