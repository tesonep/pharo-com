Class {
	#name : #COMTypes,
	#superclass : #SharedPool,
	#classVars : [
		'BSTR',
		'CALLCONV',
		'DISPID',
		'DISPPARAMS',
		'ELEMDESC',
		'EXCEPINFO',
		'FUNCDESC',
		'FUNCKIND',
		'IDLDESC',
		'INVOKEKIND',
		'LCID',
		'LPBSTR',
		'LPPARAMDESCEX',
		'MEMBERID',
		'PARAMDESC',
		'REFGUID',
		'SCODE',
		'TYPEATTR',
		'TYPEDESC',
		'TYPEKIND',
		'VARIANT'
	],
	#pools : [
		'WinRegTypes'
	],
	#category : #'PharoCOM-Types'
}

{ #category : #'class initialization' }
COMTypes class >> initialize [
	"COM Types"
	LCID := DWORD.
	
	DISPID := LONG.
	MEMBERID := DISPID.
		
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

	BSTR := #'BSTRString'.
	LPBSTR := POINTER_HOLDER.
	
	REFGUID := #'void*'.
	
	SCODE := LONG.
]
