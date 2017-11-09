class initialization
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
	
	"COM Types"
	LCID := DWORD.
	
	DISPID := LONG.
	MEMBERID := DISPID.
	LPOLESTR := BSTR.
	
	VARIANT := #'Win32Variant'.
	
	TYPEKIND := #COMTypeKind.
	TYPEDESC := #COMTypeDesc.
	IDLDESC := #COMIdlDesc.
	ELEMDESC := #COMElemDesc.
	FUNCKIND := #COMFuncKind.
	INVOKEKIND := #COMInvokeKind.
	CALLCONV := #COMCallConv.
	TYPEATTR := #COMTypeAttributes.
	FUNCDESC := #COMFuncDesc.
	PARAMDESC := #COMParamDesc.
	LPPARAMDESCEX := #'void*'.
	DISPPARAMS := #COMDispParams.
	EXCEPINFO := #COMExcepInfo.
	
	SCODE := LONG.
	
	" CONST "
	LOCALE_USER_DEFAULT := 16r400.