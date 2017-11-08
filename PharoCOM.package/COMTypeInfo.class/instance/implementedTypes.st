querying
implementedTypes
	(self typeKind = COMTypeKind interface or: [ self typeKind = COMTypeKind coClass ])
		ifFalse: [ self error: 'It only applies to TKIND_INTERFACE or TKIND_COCLASS' ].

	^ (0 to: self implementedTypesNumber - 1)
		collect: [ :i | self getImplementedTypeIndex: i ]