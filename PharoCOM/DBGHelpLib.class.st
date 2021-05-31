"
DBGHelpLib uniqueInstance initLibrary.
moduleId := DBGHelpLib uniqueInstance loadModule: 'ACEDAO.DLL'.
moduleId := 140710187302912.
 
DBGHelpLib uniqueInstance unloadModule: moduleId.
symbols := OrderedCollection new .

 DBGHelpLib uniqueInstance enumerateSymbols: moduleId callback: [ :pSymbol :size : usc | symbols add: (DBGSymbolInfo fromHandle: pSymbol ) name  .  false ].
 DBGHelpLib uniqueInstance enumerateTypes: moduleId callback: [ :pSymbol :size : usc | symbols add: (DBGSymbolInfo fromHandle: pSymbol ) name  .  true ].
 DBGHelpLib uniqueInstance enumerateModules: [ : moduleName : baseDll : void |  self traceCr:moduleName, ' : ', baseDll asString . true ]. 

Kernel32Lib uniqueInstance currentProcessHandle .
DGBEnumerateModules .
DGBEnumerateSymbols on: [ :moduleN :size : usc | self halt. ]. 

'C:\Program Files (x86)\Common Files\Microsoft Shared\OFFICE16\ACEDAO.DLL'asFileReference exists .
 
'C:\Program Files (x86)\Microsoft Office\root\Office16\ACEDAO.DLL' asFileReference exists .

DBGHelpLib recompile
"
Class {
	#name : #DBGHelpLib,
	#superclass : #FFILibrary,
	#traits : 'TWinErrorChecker',
	#classTraits : 'TWinErrorChecker classTrait',
	#instVars : [
		'processHandle'
	],
	#pools : [
		'DBGHelpTypes'
	],
	#category : #'PharoCOM-DBGHelp'
}
