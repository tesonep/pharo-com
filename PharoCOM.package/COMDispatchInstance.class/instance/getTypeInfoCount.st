querying
getTypeInfoCount
	| return pointer |
	
	pointer := ExternalAddress allocate: Smalltalk wordSize.
	pointer autoRelease.
	
	return := self ffiGetTypeInfoCount: pointer.
	
	(return ~= 0) ifTrue:[ self reportError: return].
	
	^ pointer unsignedLongAt: 1.
