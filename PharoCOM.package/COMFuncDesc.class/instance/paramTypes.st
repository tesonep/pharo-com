accessing structure variables
paramTypes
	^ FFIExternalArray fromHandle: self lprgelemdescParam getHandle type: 'COMElemDesc' size: self cParams.