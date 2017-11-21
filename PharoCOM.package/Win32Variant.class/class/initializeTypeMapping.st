initialization
initializeTypeMapping
	"	self initializeTypeMapping. "

	PointerType := 26.
	TypeMapping := ({
		(Win32VariantUnimplementedType new: #NULL as: 1).
		(Win32VariantUnimplementedType new: #int16 as: 2).
		(Win32VariantInt32 new: #int32 as: 3).
		(Win32VariantUnimplementedType new: #float as: 4).
		(Win32VariantUnimplementedType new: #double as: 5).
		(Win32VariantUnimplementedType new: #CURRENCY as: 6).
		(Win32VariantUnimplementedType new: #DATE as: 7).
		(Win32VariantUnimplementedType new: #Win32WideString as: 8).
		(Win32VariantUnimplementedType new: #COMDispatchInstance as: 9).
		(Win32VariantUnimplementedType new: #ERROR as: 10).
		(Win32VariantBool new: #BOOL as: 11).
		(Win32VariantUnimplementedType new: #Win32Variant as: 12).
		(Win32VariantUnimplementedType new: #COMUnknownInstance as: 13).
		(Win32VariantUnimplementedType new: #DECIMAL as: 14).
		(Win32VariantUnimplementedType new: #byte as: 16).
		(Win32VariantUnimplementedType new: #ubyte as: 17).
		(Win32VariantUnimplementedType new: #uint16 as: 18).
		(Win32VariantUnimplementedType new: #uint32 as: 19).
		(Win32VariantUnimplementedType new: #longlong as: 20).
		(Win32VariantUnimplementedType new: #ulonglong as: 21).
		(Win32VariantUnimplementedType new: #int as: 22).
		(Win32VariantUnimplementedType new: #uint as: 23).
		(Win32VariantVoid newAs: 24).
		(Win32VariantUnimplementedType new: #HRESULT as: 25).
		(Win32VariantUnimplementedType new: #PTR as: 26).
		(Win32VariantUnimplementedType new: #SAFEARRAY as: 27).
		(Win32VariantUnimplementedType new: #CARRAY as: 28).
		(Win32VariantUnimplementedType new: #USERDEFINED as: 29).
		(Win32VariantUnimplementedType new: #String as: 30).
		(Win32VariantUnimplementedType new: #Win32WideString as: 31).
		(Win32VariantUnimplementedType new: #RECORD as: 32).
		(Win32VariantUnimplementedType new: #GUID as: 72)
	} collect: [ :e | e typeNumber -> e ]) asDictionary