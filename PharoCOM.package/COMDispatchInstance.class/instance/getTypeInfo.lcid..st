querying
getTypeInfo: iTInfo lcid: lcid
	| typeInfo return pointer |
	
	pointer := ExternalAddress allocate: Smalltalk wordSize.
	pointer autoRelease.
	
	return := self ffiGetTypeInfo: iTInfo lcid: lcid into: pointer.
	
	(return ~= 0) ifTrue:[ self reportError: return].
	
	typeInfo := COMTypeInfo fromHandle:  pointer.
	typeInfo autoRelease.
	^ typeInfo.
