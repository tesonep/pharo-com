querying
calculateType
	| type internalType |
	type := self translateType.

	(self isPointerType) ifTrue: [  
		internalType := COMTypeDesc fromHandle: self content getHandle.
		type := Win32VariantPointer wrap: internalType calculateType.
	].

	^ type.