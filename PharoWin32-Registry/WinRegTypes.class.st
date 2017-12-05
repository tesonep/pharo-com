"
I am a SharedPool with all the FFI types used in the registry functions.
"
Class {
	#name : #WinRegTypes,
	#superclass : #SharedPool,
	#traits : 'TWinErrorChecker',
	#classTraits : 'TWinErrorChecker classTrait',
	#classVars : [
		'HKEY',
		'KEY_ALL_ACCESS',
		'KEY_CREATE_LINK',
		'KEY_CREATE_SUB_KEY',
		'KEY_ENUMERATE_SUB_KEYS',
		'KEY_EXECUTE',
		'KEY_NOTIFY',
		'KEY_QUERY_VALUE',
		'KEY_READ',
		'KEY_SET_VALUE',
		'KEY_WOW64_32KEY',
		'KEY_WOW64_64KEY',
		'KEY_WRITE',
		'LPBYTE',
		'LPDWORD',
		'NULL_LPDWORD',
		'PFILETIME',
		'PHKEY',
		'REGSAM'
	],
	#pools : [
		'Win32Types'
	],
	#category : #'PharoWin32-Registry'
}

{ #category : #'class initialization' }
WinRegTypes class >> initialize [
	"SAM Constants"

	"Combines the STANDARD_RIGHTS_REQUIRED, KEY_QUERY_VALUE, KEY_SET_VALUE, KEY_CREATE_SUB_KEY, KEY_ENUMERATE_SUB_KEYS, KEY_NOTIFY, and KEY_CREATE_LINK access rights."
	KEY_ALL_ACCESS := 16rF003F. 
	"Reserved for system use."
	KEY_CREATE_LINK := 16r0020.
	"Required to create a subkey of a registry key."
	KEY_CREATE_SUB_KEY := 16r0004.
	"Required to enumerate the subkeys of a registry key."
	KEY_ENUMERATE_SUB_KEYS := 16r0008.
	"Equivalent to KEY_READ."
	KEY_EXECUTE := 16r20019.
	"Required to request change notifications for a registry key or for subkeys of a registry key."
	KEY_NOTIFY := 16r0010.
	"Required to query the values of a registry key."
	KEY_QUERY_VALUE := 16r0001.
	"Combines the STANDARD_RIGHTS_READ, KEY_QUERY_VALUE, KEY_ENUMERATE_SUB_KEYS, and KEY_NOTIFY values."
	KEY_READ := 16r20019.
	"Required to create, delete, or set a registry value."
	KEY_SET_VALUE := 16r0002.
	"Indicates that an application on 64-bit Windows should operate on the 32-bit registry view. This flag is ignored by 32-bit Windows. For more information, see Accessing an Alternate Registry View.
	This flag must be combined using the OR operator with the other flags in this table that either query or access registry values."
	KEY_WOW64_32KEY := 16r0200.
	"Indicates that an application on 64-bit Windows should operate on the 64-bit registry view. This flag is ignored by 32-bit Windows. For more information, see Accessing an Alternate Registry View.
	This flag must be combined using the OR operator with the other flags in this table that either query or access registry values."
	KEY_WOW64_64KEY := 16r0100.
	"Combines the STANDARD_RIGHTS_WRITE, KEY_SET_VALUE, and KEY_CREATE_SUB_KEY access rights."
	KEY_WRITE := 16r20006.


	"Types"	
	HKEY := 'void*'.
	PHKEY := FFIExternalValueHolder ofType: HKEY.
	REGSAM := DWORD.

	LPBYTE := 'void*'.
	LPDWORD := FFIExternalValueHolder ofType: DWORD.
	NULL_LPDWORD := FFIExternalObject null.

	PFILETIME := 'void*'.
]
