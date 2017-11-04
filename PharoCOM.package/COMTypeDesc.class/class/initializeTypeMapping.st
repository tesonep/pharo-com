initialization
initializeTypeMapping

"	self initializeTypeMapping. "

	PointerType := 26.
	TypeMapping := {  
       	1 -> #NULL.
		 	2 -> #int16.
			3 -> #int32.
			4 -> #float.
			5 -> #double.
			6 -> #CURRENCY.
			7 -> #DATE.
			8 -> #Win32WideString.
			9 -> #COMDispatchInstance.
			10 -> #ERROR.
			11 -> #BOOL.
			12 -> #Win32Variant.
			13 -> #COMUnknownInstance.
			14 -> #DECIMAL.
			16 -> #byte.
			17 -> #ubyte.
			18 -> #uint16.
			19 -> #uint32.
			20 -> #longlong.
			21 -> #ulonglong.
			22 -> #int.
			23 -> #uint.
			24 -> #VOID.
			25 -> #HRESULT.
			26 -> #PTR.
			27 -> #SAFEARRAY.
			28 -> #CARRAY.
			29 -> #USERDEFINED.
			30 -> #String.
			31 -> #Win32WideString.
			32 -> #RECORD.
			
			72 -> #GUID.

	} asDictionary.