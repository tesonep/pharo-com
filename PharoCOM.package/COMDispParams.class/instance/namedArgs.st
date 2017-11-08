accessing structure variables
namedArgs
	"This method was automatically generated"
	^ExternalData 
		fromHandle: (handle platformLongAt: OFFSET_NAMEDARGS)
		type: FFIArchitecture forCurrentArchitecture externalLongType asPointerType