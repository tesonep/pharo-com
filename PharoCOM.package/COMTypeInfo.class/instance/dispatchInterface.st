querying
dispatchInterface
	self typeKind = COMTypeKind dispatch ifTrue:[ ^ self ].
	^ self getImplementedTypeIndex: -1.