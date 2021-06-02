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
		'VARDESC',
		'VARIANT',
		'VARKIND'
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
	VARKIND :=  #COMVarKind.
	TYPEDESC := #COMTypeDesc.
	IDLDESC := #COMIdlDesc.
	ELEMDESC := #COMElemDesc.
	FUNCKIND := #COMFuncKind.
	INVOKEKIND := #COMInvokeKind.
	CALLCONV := #COMCallConv.
	TYPEATTR := #COMTypeAttributes.
	FUNCDESC := #COMFuncDesc.
	VARDESC := COMVarDesc.
	PARAMDESC := #COMParamDesc.
	LPPARAMDESCEX := #'void*'.
	DISPPARAMS := #COMDispParams.
	EXCEPINFO := #COMExcepInfo.

	BSTR := #'BSTRString'.
	LPBSTR := POINTER_HOLDER.
	
	REFGUID := #'void*'.
	
	SCODE := LONG.
]
