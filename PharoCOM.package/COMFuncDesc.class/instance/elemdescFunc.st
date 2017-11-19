accessing structure variables
elemdescFunc
	"This method was automatically generated"
	^ COMElemDesc fromHandle: (handle referenceStructAt: OFFSET_ELEMDESCFUNC length: COMElemDesc byteSize)