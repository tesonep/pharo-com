class initialization
initialize
	"COM Types"
	LCID := DWORD.
	
	DISPID := LONG.
	MEMBERID := DISPID.
		
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
