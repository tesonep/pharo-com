querying
typeKind
	^ typeKind ifNil:[ self fillTypeAttributes. typeKind].