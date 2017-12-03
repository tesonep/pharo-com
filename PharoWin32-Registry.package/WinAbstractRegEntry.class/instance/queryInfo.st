private
queryInfo
	| returnCode nullLPDWORD subKeyCountHolder valuesCountHolder subKeyNameMaxHolder valueNameMaxHolder valueDataMaxHolder |
	nullLPDWORD := FFIExternalObject null.
	
	subKeyCountHolder := LPDWORD new.
	subKeyNameMaxHolder := LPDWORD new.
	
	valuesCountHolder := LPDWORD new.
	valueNameMaxHolder := LPDWORD new.
	valueDataMaxHolder := LPDWORD new.

	returnCode := AdvApi32Lib uniqueInstance
		ffiRegQueryInfoKey: self handle
		keyClassNameHolder: FFIExternalObject null
		keyClassNameLengthHolder: nullLPDWORD
		reserved: nullLPDWORD
		subKeyCountHolder: subKeyCountHolder
		subKeyNameMaxHolder: subKeyNameMaxHolder
		subKeyClassMaxHolder: nullLPDWORD
		valuesCountHolder: valuesCountHolder
		valueNameMaxHolder: valueNameMaxHolder
		valueDataMaxHolder: valueDataMaxHolder
		securityDescriptorSizeHolder: nullLPDWORD
		lastWriteTimeHolder: nil.

	returnCode ~= 0
		ifTrue: [ Kernel32Lib uniqueInstance reportError: returnCode ].
	
	subKeyCount := subKeyCountHolder value.
	subKeyNameMax := subKeyNameMaxHolder value.
	
	valuesCount := valuesCountHolder value.
	valueNameMax := valueNameMaxHolder value.
	valueDataMax := valueDataMaxHolder value.

