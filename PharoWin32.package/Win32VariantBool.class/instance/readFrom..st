accessing
readFrom: aVariant
	^ (aVariant data at: 1) = 16rff and: [ (aVariant data at: 2) = 16rff ]