Class {
	#name : #Win32Types,
	#superclass : #SharedPool,
	#classVars : [
		'BYTE',
		'Byte8',
		'DWORD',
		'HRESULT',
		'HWND',
		'LOCALE_USER_DEFAULT',
		'LONG',
		'LPCLSID',
		'LPCSTR',
		'LPCWCH',
		'LPOLESTR',
		'LPSTR',
		'LPVOID',
		'LPWSTR',
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
	#category : 'PharoWin32-Types'
}

{ #category : #'class initialization' }
Win32Types class >> initialize [
	" 
		self initialize 
	"

	DWORD := #ulong.
	ULONG := #ulong.
	LONG := #long.
	
	HRESULT := #ulong.
	LPVOID := #'void*'.
	LPCSTR := #String.
	LPSTR := LPCSTR.
	LPWSTR := #Win32WideString.
	LPCWCH := LPWSTR.
		
	HWND := LONG.
	UINT := #uint.
	
	UINT_PTR := FFIExternalValueHolder ofType: 'uint'.
	ULONG_PTR := FFIExternalValueHolder ofType: 'ulong'.
	
	LPCLSID := #'void*'.
	WORD := #ushort.
	BYTE := #byte.
	VARTYPE := #ushort.
	SHORT := #short.
	USHORT := #ushort.
	
	PVOID := #'void*'.
	
	Byte8 := FFITypeArray ofType: #byte size: 8.

	LPOLESTR := #Win32WideString.

		
	" CONST "
	LOCALE_USER_DEFAULT := 16r400.
]
