instance creation
createInstanceOf: clsidString
	| refiid pointer ret clsid |
	refiid := GUID fromString: '{00020400-0000-0000-C000-000000000046}'.
	clsid := GUID fromString: clsidString.
	
	pointer := ExternalAddress allocate: Smalltalk wordSize.
	pointer autoRelease.

	ret := COMLib uniqueInstance ffiCoCreateInstance:pointer of:clsid as: refiid.
	(ret ~= 0) ifTrue:[ self reportError: ret].
	
	^ self fromHandle: (pointer pointerAt: 1).