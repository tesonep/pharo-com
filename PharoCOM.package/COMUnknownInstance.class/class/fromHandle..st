instance creation
fromHandle: aHandle
	^ (self basicFromHandle: aHandle)
		autoRelease;
		yourself