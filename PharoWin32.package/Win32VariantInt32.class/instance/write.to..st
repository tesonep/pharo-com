accessing
write: aValue to: aVariant
	aVariant rawData signedLongAt: 1 put: aValue.
