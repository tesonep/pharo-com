accessing structure variables
args
	"This method was automatically generated"
	^Win32Variant fromHandle: (handle pointerAt: OFFSET_ARGS)