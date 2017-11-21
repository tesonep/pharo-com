accessing structure variables
data
	"This method was automatically generated"
	^(FFITypeArray ofType: FFIUInt8 size: 8) fromHandle: (handle copyFrom: OFFSET_DATA to: OFFSET_DATA + 7)