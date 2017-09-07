accessing structure variables
data4
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIUInt8 size: 8) fromHandle: (handle copyFrom: 9 to: 16)