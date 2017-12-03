accessing
entries
	^ entries ifNil: [ self fillEntries. entries ]