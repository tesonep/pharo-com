private
getImplementedTypeIndex: index
	| pointer ret href |
	pointer := ExternalAddress allocate: (Smalltalk wordSize).
	pointer autoRelease.

	ret := self ffiGetRefTypeOfImplTypeIndex: index pointer: pointer.
	(ret ~= 0) ifTrue:[ self reportError: ret ].
	
	href := pointer signedLongAt: 1.
	ret := self ffiGetRefTypeInfo: href pointer: pointer.
	(ret ~= 0) ifTrue:[ self reportError: ret ].

	^ self class fromHandle: (pointer pointerAt:1).