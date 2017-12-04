"
I am a SharedPool with all the FFI types used in the registry functions.
"
Class {
	#name : #WinRegTypes,
	#superclass : #SharedPool,
	#classVars : [
		'HKEY',
		'HKEY_CLASSES_ROOT',
		'HKEY_CURRENT_USER',
		'HKEY_LOCAL_MACHINE',
		'HKEY_PERFORMANCE_DATA',
		'HKEY_PERFORMANCE_NLSTEXT',
		'HKEY_PERFORMANCE_TEXT',
		'HKEY_USERS',
		'KEY_READ',
		'LPCTSTR',
		'LPDWORD',
		'LPTSTR',
		'PFILETIME',
		'PHKEY',
		'REGSAM'
	],
	#pools : [
		'Win32Types'
	],
	#category : 'PharoWin32-Registry'
}

{ #category : #'class initialization' }
WinRegTypes class >> initialize [
	"Root Key Constants"
	HKEY_CLASSES_ROOT := WinRegRootEntry fromAddress: 16r80000000.
	HKEY_CURRENT_USER := WinRegRootEntry fromAddress: 16r80000001.
	HKEY_LOCAL_MACHINE := WinRegRootEntry fromAddress: 16r80000002.
	HKEY_USERS := WinRegRootEntry fromAddress: 16r80000003.
	HKEY_PERFORMANCE_DATA := WinRegRootEntry fromAddress: 16r80000004.
	HKEY_PERFORMANCE_TEXT := WinRegRootEntry fromAddress: 16r80000050.
	HKEY_PERFORMANCE_NLSTEXT := WinRegRootEntry fromAddress: 16r80000060.

	"SAM Constants"
	KEY_READ := 16r20019.

	"Types"	
	HKEY := 'void*'.
	PHKEY := FFIExternalValueHolder ofType: HKEY.
	REGSAM := DWORD.

	LPTSTR := 'Win32WideString'.
	LPCTSTR := 'Win32WideString'.

	LPDWORD := FFIExternalValueHolder ofType: DWORD.
	PFILETIME := 'void*'.
]
