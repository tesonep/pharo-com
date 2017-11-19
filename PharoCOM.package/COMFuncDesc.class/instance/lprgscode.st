accessing structure variables
lprgscode
	"This method was automatically generated"
	^ExternalData 
		fromHandle: (handle platformLongAt: OFFSET_LPRGSCODE)
		type: FFIArchitecture forCurrentArchitecture externalLongType asPointerType