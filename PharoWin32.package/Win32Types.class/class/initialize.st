as yet unclassified
initialize
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
	BSTR := #Win32WideString.
	LPBSTR := #'Win32WideString*'.
		
	HWND := #'void*'.
	UINT := #uint.
	LPCLSID := #'void*'.
	WORD := #ushort.
	BYTE := #byte.
	VARTYPE := #ushort.
	SHORT := #short.
	
	Byte8 := FFITypeArray ofType: 'byte' size: 8.
	LCID := DWORD.
	
	DISPID := LONG.
	MEMBERID := DISPID.
	LPOLESTR := BSTR.
	
	TYPEKIND := #COMTypeKind.
	TYPEDESC := #COMTypeDesc.
	IDLDESC := #COMIdlDesc.
	ELEMDESC := #COMElemDesc.
	FUNCKIND := #COMFuncKind.
	INVOKEKIND := #COMInvokeKind.
	CALLCONV := #COMCallConv.
	
	SCODE := LONG.