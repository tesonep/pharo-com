ffi-calls
getNamesOfMemberID: memberId maxNames: maxNames
	| arrayStrings holder return cant wideStrings |
	
	arrayStrings := ExternalAddress allocate:maxNames * Smalltalk wordSize.
	arrayStrings autoRelease.

	holder := ExternalAddress allocate: Smalltalk wordSize.	

	return := self ffiGetNamesOf: memberId into: arrayStrings size: maxNames count: holder.
	(return ~= 0) ifTrue:[self reportError: return].
	
	cant := holder unsignedLongAt: 1.
	wideStrings := OrderedCollection new.
	0 to:(cant - 1) do:[:idx | wideStrings add: (Win32WideString fromHandle: (arrayStrings pointerAt: (1 + (Smalltalk wordSize * idx))))].
	wideStrings do: #autoRelease.
	
	^ wideStrings collect: #asString