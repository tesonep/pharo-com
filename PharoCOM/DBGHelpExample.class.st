Class {
	#name : #DBGHelpExample,
	#superclass : #Object,
	#category : #'PharoCOM-DBGHelp'
}

{ #category : #'as yet unclassified' }
DBGHelpExample >> exampleEnumerateModules [
	<script: 'self  new exampleEnumerateModules '>
	Transcript open.
	DBGHelpLib uniqueInstance initLibrary.
	DBGHelpLib uniqueInstance enumerateModules: [ :moduleName :baseDll :void | 
		self traceCr: moduleName , ' : ' , baseDll asString.
		true ]
]

{ #category : #'as yet unclassified' }
DBGHelpExample >> exampleLoadEnumerateSymbols [

	<script: 'self  new exampleLoadEnumerateSymbols '>
	| symbols moduleId |
	DBGHelpLib uniqueInstance initLibrary.
	(UIManager default
		 request: 'Please write the path of a DLL to load. '
		 initialAnswer: '') ifNotNil: [ :n | 
		" Load module. "
		moduleId := DBGHelpLib uniqueInstance loadModule: n.
		symbols := OrderedCollection new.
		
		" Request to enumerate all the symbols "
		DBGHelpLib uniqueInstance
			enumerateSymbols: moduleId
			callback: [ :pSymbol :size :usc | 
				" The pSymbol pointer is valid **ONLY** during the callback execution. "
				symbols add: (DBGSymbolInfo fromHandle: pSymbol) name.
				true ].

		"Inspect collection with symbol names. "
		
		
		
		symbols inspect ]
]
