Class {
	#name : #COMTypeLibRegistryReader,
	#superclass : #Object,
	#traits : 'TWinErrorChecker',
	#classTraits : 'TWinErrorChecker classTrait',
	#instVars : [
		'libs'
	],
	#pools : [
		'COMTypes'
	],
	#category : #'PharoCOM-TypeLibraries'
}

{ #category : #reading }
COMTypeLibRegistryReader >> readAll [
	libs := OrderedCollection new.
	(WinRegRootEntry HKEY_CLASSES_ROOT / 'TypeLib') subKeys do: [ :e | self readKey: e ].
	^ libs
]

{ #category : #reading }
COMTypeLibRegistryReader >> readKey: key [

	key subKeys do: [ :sub | 
		| libName languageIDs win32 win64 |
		libName := sub values
			           detect: [ :e | e name = '' ]
			           ifFound: [ :v | v value ]
			           ifNone: [ nil ].
		languageIDs := self readLanguageIDs: sub.

		key subKeys first subKeys
			detect: [ :i | i subKey size = 1 and: [ i subKey asInteger isNotNil ] ]
			ifFound: [ :i | 
				i subKeys
					detect: [ :f | f subKey asLowercase = 'win32' ]
					ifFound: [ :f | 
						win32 := f values
							         detect: [ :e | e name = '' ]
							         ifFound: [ :v | v value asFileReference ]
							         ifNone: [ nil ] ].
				i subKeys
					detect: [ :f | f subKey asLowercase = 'win64' ]
					ifFound: [ :f | 
						win64 := f values
							         detect: [ :e | e name = '' ]
							         ifFound: [ :v | v value asFileReference ]
							         ifNone: [ nil ] ] ].

		libs add: (COMTypeLibName new
				 guid: key subKey;
				 name: libName;
				 version: sub subKey;
				 win32Path: win32;
				 win64Path: win64;
				 languageIDs: languageIDs;
				 yourself) ]
]

{ #category : #reading }
COMTypeLibRegistryReader >> readLanguageIDs: key [
	^ key subKeys
		reject: [ :e | e subKey = 'FLAGS' or: [ e subKey = 'HELPDIR' ] ]
		thenCollect: [ :e | e subKey asInteger ]
]
