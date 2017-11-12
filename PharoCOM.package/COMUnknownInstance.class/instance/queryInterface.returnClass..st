querying
queryInterface: aGUID returnClass: aClass
	| holder ret |
	holder := ExternalAddress allocate: Smalltalk wordSize.
	holder autoRelease.
	
	ret := self ffiQueryInterface: aGUID into: holder.
	
	(ret ~= 0) ifTrue:[ self reportError: ret].
	
	^ (aClass fromHandle: holder).
