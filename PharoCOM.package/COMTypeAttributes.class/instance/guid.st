accessing structure variables
guid
	"This method was automatically generated"
	^ GUID fromHandle: (handle referenceStructAt: OFFSET_GUID length: GUID byteSize)