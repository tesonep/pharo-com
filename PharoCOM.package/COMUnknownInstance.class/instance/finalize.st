reference counting
finalize
	handle isNull ifFalse:[ self release ].
	handle beNull.