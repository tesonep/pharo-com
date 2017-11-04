as yet unclassified
calculateType
	| type internalType |
	type := self translateType.

	(self isPointerType) ifTrue: [  
		internalType := COMTypeDesc fromHandle: self content getHandle.
		type := internalType calculateType , '*'.
	].

	^ type.