querying
guid
	^ guid ifNil:[ self fillTypeAttributes. guid ]