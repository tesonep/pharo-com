accessing structure variables
pfnDeferredFillIn
	"This method was automatically generated"
	^ExternalData 
		fromHandle: (handle platformUnsignedLongAt: OFFSET_PFNDEFERREDFILLIN)
		type: FFIArchitecture forCurrentArchitecture externalULongType asPointerType