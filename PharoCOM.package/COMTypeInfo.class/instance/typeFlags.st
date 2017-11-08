querying
typeFlags
	^ typeFlags ifNil:[ self fillTypeAttributes. typeFlags ]