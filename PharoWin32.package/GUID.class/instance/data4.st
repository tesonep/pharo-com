accessing structure variables
data4
	"This method was automatically generated"
	^(FFITypeArray ofType: FFIUInt8 size: 8) fromHandle: (handle copyFrom: OFFSET_DATA4 to: OFFSET_DATA4 + 7)