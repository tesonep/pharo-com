accessing
argsArray
	^ FFIExternalArray
		fromHandle: (handle pointerAt: OFFSET_ARGS)
		type: #Win32Variant
		size: self cArgs