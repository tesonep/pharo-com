accessing structure variables
pvReserved
	"This method was automatically generated"
	^ExternalData 
		fromHandle: (handle platformUnsignedLongAt: OFFSET_PVRESERVED)
		type: FFIArchitecture forCurrentArchitecture externalULongType asPointerType