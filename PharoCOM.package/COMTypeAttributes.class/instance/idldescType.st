accessing structure variables
idldescType
	"This method was automatically generated"
	^ COMIdlDesc fromHandle: (handle referenceStructAt: OFFSET_IDLDESCTYPE length: COMIdlDesc byteSize)