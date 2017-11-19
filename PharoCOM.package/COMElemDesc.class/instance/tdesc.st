accessing structure variables
tdesc
	"This method was automatically generated"
	^ COMTypeDesc fromHandle: (handle referenceStructAt: OFFSET_TDESC length: COMTypeDesc byteSize)