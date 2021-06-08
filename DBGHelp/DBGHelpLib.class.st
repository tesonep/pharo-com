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
	#category : #DBGHelp
}

{ #category : #'class initialization' }
DBGHelpLib class >> initialize [

	SessionManager default
		registerSystemClassNamed: self name
		atPriority: 60
]

{ #category : #'class initialization' }
DBGHelpLib class >> shutDown: quitting [ 
	quitting ifFalse: [ ^ self ]. 
	self uniqueInstance resetLibrary 
]

{ #category : #'class initialization' }
DBGHelpLib class >> startUp: isNewSession [ 
	isNewSession ifTrue: [ self uniqueInstance ensureProcessHandleIsNil ]
]

{ #category : #convenience }
DBGHelpLib >> defaultInvasive [
	^ true 
]

{ #category : #convenience }
DBGHelpLib >> defaultPath [
	^ nil
]

{ #category : #convenience }
DBGHelpLib >> defaultProcessHandle [
	^ Kernel32Lib uniqueInstance currentProcessHandle "90480 + ((Random seed: DateAndTime now asUnixTime) nextInt: 4000) "
]

{ #category : #'reporting errors' }
DBGHelpLib >> ensureProcessHandleIsNil [
	processHandle := nil
]

{ #category : #enumerations }
DBGHelpLib >> enumerateModules: aCallback [
	^ (self
		ffiEnumerateModules: self processHandle
		callback: (DGBEnumerateModules on: aCallback))
		ifFalse: [ self reportError: 0 ]
]

{ #category : #enumerations }
DBGHelpLib >> enumerateSymbols: baseDLL callback: aCallback [
	^ (self
		ffiEnumerateSymbols: self processHandle
		baseDll: baseDLL
		matching: '*'
		callback: (DGBEnumerateSymbols on: aCallback))
		ifFalse: [ self reportError: 0 ] 
]

{ #category : #'things that should work but do not' }
DBGHelpLib >> enumerateTypes: baseDLL callback: aCallback [
	^ (self
		ffiEnumerateTypes: self processHandle
		baseDll: baseDLL
		matching: '*'
		callback: (DGBEnumerateSymbols on: aCallback))
		ifFalse: [ self reportError: 0 ] 
]

{ #category : #'reporting errors' }
DBGHelpLib >> ffiDBGHelpCleanUp: processHandleNumber [
	"
https://docs.microsoft.com/en-us/windows/win32/api/dbghelp/nf-dbghelp-symcleanup
BOOL IMAGEAPI SymCleanup(
  HANDLE hProcess
);"

	^ self ffiCall: #(BOOL SymCleanup #(HANDLE processHandleNumber))
]

{ #category : #'reporting errors' }
DBGHelpLib >> ffiDBGHelpInitializeLibraryWithProcessHandle: aNumber path: aPathString invasive: aBoolean [ 
"
https://docs.microsoft.com/en-us/windows/win32/api/dbghelp/nf-dbghelp-syminitialize
BOOL IMAGEAPI SymInitialize(
  HANDLE hProcess,
  PCSTR  UserSearchPath,
  BOOL   fInvadeProcess
);"
	^ self ffiCall: #(BOOL SymInitialize #(HANDLE aNumber, LPCSTR aPathString, BOOL aBoolean ))
]

{ #category : #'reporting errors' }
DBGHelpLib >> ffiDBGHelpLoadModule: hProcess path: imageName moduleName: moduleName [
	"
This function returns the BaseOfDll value. required for many other operations ! 
https://docs.microsoft.com/en-us/windows/win32/api/dbghelp/nf-dbghelp-symloadmoduleex
DWORD64 IMAGEAPI SymLoadModuleEx(
  HANDLE        hProcess,
  HANDLE        hFile,
  PCSTR         ImageName,
  PCSTR         ModuleName,
  DWORD64       BaseOfDll,
  DWORD         DllSize,
  PMODLOAD_DATA Data,
  DWORD         Flags
);"

	^ self
		ffiCall:
			#(DWORD64 SymLoadModuleEx #(HANDLE hProcess, nil, LPCSTR imageName, LPCSTR moduleName, 0, 0, nil, 0))
]

{ #category : #'reporting errors' }
DBGHelpLib >> ffiDBGHelpUnLoadModule: hProcess baseDll: baseDLL [ 
	"
The BaseOfDll is the loading point of the dll. 
This info can be obtained from the enumeration of the modules
https://docs.microsoft.com/en-us/windows/win32/api/dbghelp/nf-dbghelp-symunloadmodule
BOOL IMAGEAPI SymUnloadModule(
  HANDLE hProcess,
  DWORD  BaseOfDll
);"

	^ self
		ffiCall:
			#(BOOL SymUnloadModule #(HANDLE hProcess, DWORD baseDLL))
]

{ #category : #'reporting errors' }
DBGHelpLib >> ffiEnumerateModules: hProcess  callback: aCallback [
	"
	https://docs.microsoft.com/en-us/windows/win32/api/dbghelp/nf-dbghelp-symenumeratemodules64
BOOL IMAGEAPI SymEnumerateModules64(
  HANDLE                      hProcess,
  PSYM_ENUMMODULES_CALLBACK64 EnumModulesCallback,
  PVOID                       UserContext
);
"

	^ self
		ffiCall:
			#(BOOL SymEnumerateModules64 #(HANDLE hProcess, SYM_ENUMMODULES_CALLBACK64 aCallback , nil))
]

{ #category : #'reporting errors' }
DBGHelpLib >> ffiEnumerateSymbols: hProcess baseDll: baseDLL matching: aString callback: aCallback [
	"
BOOL IMAGEAPI SymEnumSymbols(
  HANDLE                         hProcess,
  ULONG64                        BaseOfDll,
  PCSTR                          Mask,
  PSYM_ENUMERATESYMBOLS_CALLBACK EnumSymbolsCallback,
  PVOID                          UserContext
);
"

	^ self
		ffiCall:
			#(BOOL SymEnumSymbols #(HANDLE hProcess , ulonglong baseDLL , LPCSTR aString , SYM_ENUMERATESYMBOLS_CALLBACK aCallback , nil))
]

{ #category : #'things that should work but do not' }
DBGHelpLib >> ffiEnumerateTypes: hProcess baseDll: baseDLL matching: aString callback: aCallback [
	"
BOOL IMAGEAPI SymEnumTypesByName(
  HANDLE                         hProcess,
  ULONG64                        BaseOfDll,
  PCSTR                          mask,
  PSYM_ENUMERATESYMBOLS_CALLBACK EnumSymbolsCallback,
  PVOID                          UserContext
);
"
"	self error: 'For some reason this function does not really work. It finishes oftenly with an ""invalid argument"" '."
	^ self
		ffiCall:
			#(BOOL SymEnumTypesByName #(HANDLE hProcess, ulonglong baseDLL,LPCSTR aString , SYM_ENUMERATESYMBOLS_CALLBACK aCallback, 0))
]

{ #category : #initialize }
DBGHelpLib >> initLibrary [
	self resetLibrary.
	processHandle := self defaultProcessHandle.
	(self
		ffiDBGHelpInitializeLibraryWithProcessHandle: processHandle
		path: self defaultPath
		invasive: self defaultInvasive)
		ifFalse: [ self reportError: 0]
]

{ #category : #'load module' }
DBGHelpLib >> loadModule: imageName [

	^ [ self loadModule: imageName moduleName: nil ]
		  on: Win32Error
		  do: [ :e | 
			  self initLibrary.
			  ^ self loadModule: imageName moduleName: nil ]
]

{ #category : #'load module' }
DBGHelpLib >> loadModule: imageName moduleName: moduleName [
	| ret |
	ret := self
		ffiDBGHelpLoadModule: self processHandle
		path: imageName
		moduleName: moduleName.
	self reportErrorIfZero: ret.
	^ ret
]

{ #category : #convenience }
DBGHelpLib >> processHandle [
	(processHandle isNil or: [ processHandle isNull ]) ifTrue: [ 
		self initLibrary ].
	^ processHandle
]

{ #category : #initialize }
DBGHelpLib >> resetLibrary [
	processHandle ifNotNil: [ self ffiDBGHelpCleanUp: processHandle ].
	processHandle := nil
]

{ #category : #'things that should work but do not' }
DBGHelpLib >> symGetTypeFromBaseDll: baseDLL matching: aName [

	| anInfo |
	anInfo := DBGSymbolInfo externalNew
		          autoRelease;
		          yourself.
	self
		symGetTypeFromName: self processHandle
		baseDll: baseDLL
		matching: aName
		into: anInfo.
	^ anInfo
]

{ #category : #'things that should work but do not' }
DBGHelpLib >> symGetTypeFromName: hProcess baseDll: baseDLL matching: aName into: anInfo [
	"
BOOL IMAGEAPI SymEnumTypesByName(
  HANDLE                         hProcess,
  ULONG64                        BaseOfDll,
  PCSTR                          mask,
  PSYM_ENUMERATESYMBOLS_CALLBACK EnumSymbolsCallback,
  PVOID                          UserContext
);

BOOL IMAGEAPI SymGetTypeFromName(
  HANDLE       hProcess,
  ULONG64      BaseOfDll,
  PCSTR        Name,
  PSYMBOL_INFO Symbol
);

"
"	self error: 'For some reason this function does not really work. It finishes oftenly with an ""invalid argument"" '."
	^ self
		ffiCall:
			#(BOOL SymEnumTypesByName #(HANDLE hProcess, ulonglong baseDLL,LPCSTR aName , SYMBOLINFO* anInfo))
]

{ #category : #'reporting errors' }
DBGHelpLib >> unloadModule: baseDLL [
	^ self ffiDBGHelpUnLoadModule: self processHandle baseDll: baseDLL
]

{ #category : #'reporting errors' }
DBGHelpLib >> win32ModuleName [
	"While this is not a 'libc' properly, msvcrt has the functions we are defining here"
	^ 'Dbghelp.dll'
]
