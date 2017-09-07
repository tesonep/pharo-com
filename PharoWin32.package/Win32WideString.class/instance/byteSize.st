accessing
byteSize
	^ self handle isExternalAddress
		ifTrue: [ (self size + 1) * 2 ]
		ifFalse: [ self handle size ]