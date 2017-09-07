accessing structure variables
guid
	"This method was automatically generated"
	^GUID fromHandle: (handle referenceStructAt: 1 length: 16)