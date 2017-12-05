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
	key subKeys
		do: [ :sub | | libName languageIDs |
			libName := sub values detect: [ :e | e name = '' ] ifFound:[:v | v value] ifNone:[nil].
			languageIDs := self readLanguageIDs: sub.
			libs add:			
					(COMTypeLibName new
						guid: key subKey;
						name: libName;
						version: sub subKey;
						languageIDs: languageIDs;
						yourself) 
			]
]

{ #category : #reading }
COMTypeLibRegistryReader >> readLanguageIDs: key [
	^ key subKeys
		reject: [ :e | e subKey = 'FLAGS' or: [ e subKey = 'HELPDIR' ] ]
		thenCollect: [ :e | e subKey asInteger ]
]
