accessing structure variables
data
	"This method was automatically generated"
	^ COMParamDesc fromHandle: (handle referenceStructAt: OFFSET_DATA length: COMParamDesc byteSize)