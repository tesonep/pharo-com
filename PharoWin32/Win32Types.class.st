Class {
	#name : 'Win32Types',
	#superclass : 'SharedPool',
	#classVars : [
		'BOOL',
		'BYTE',
		'Byte16',
		'Byte8',
		'DWORD',
		'HANDLE',
		'HRESULT',
		'HWND',
		'LOCALE_USER_DEFAULT',
		'LONG',
		'LPBYTE',
		'LPCLSID',
		'LPCSTR',
		'LPCTSTR',
		'LPCVOID',
		'LPCWCH',
		'LPDWORD',
		'LPOLESTR',
		'LPSTR',
		'LPTSTR',
		'LPVOID',
		'LPWSTR',
		'POINTER_HOLDER',
		'PVOID',
		'SHORT',
		'UINT',
		'UINT_PTR',
		'ULONG',
		'ULONG_PTR',
		'USHORT',
		'VARTYPE',
		'WORD'
	],
	#category : 'PharoWin32-Types',
	#package : 'PharoWin32',
	#tag : 'Types'
}

{ #category : 'class initialization' }
Win32Types class >> initialize [
	" 
		self initialize 
	"

	DWORD := #ulong.
	ULONG := #ulong.
	LONG := #long.
	
	HRESULT := #ulong.
	LPVOID := #'void*'.
	LPBYTE := #'byte*'.
	LPCSTR := #String.
	LPCVOID := #'void*'.
	LPSTR := LPCSTR.
	LPDWORD := FFIExternalValueHolder ofType: 'ulong'.

	
	LPTSTR := 'Win32WideString'.
	LPCTSTR := 'Win32WideString'.	
	LPWSTR := #Win32WideString.
	LPCWCH := LPWSTR.
		
	HWND := LONG.
	HANDLE := #'void*'.
	UINT := #uint.
		
	UINT_PTR := FFIExternalValueHolder ofType: 'uint'.
	ULONG_PTR := FFIExternalValueHolder ofType: 'ulong'.
	POINTER_HOLDER := FFIExternalValueHolder ofType: 'void*'.
	
	LPCLSID := #'void*'.
	WORD := #ushort.
	BYTE := #byte.
	VARTYPE := #ushort.
	SHORT := #short.
	USHORT := #ushort.
	BOOL := #bool.
	
	PVOID := #'void*'.
	
	Byte8 := FFITypeArray ofType: #byte size: 8.
	Byte16 := FFITypeArray ofType: #byte size: 16.

	LPOLESTR := #Win32WideString.

		
	" CONST "
	LOCALE_USER_DEFAULT := 16r400.
]
