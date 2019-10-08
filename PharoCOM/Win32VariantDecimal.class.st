Class {
	#name : #Win32VariantDecimal,
	#superclass : #Win32VariantType,
	#category : #'PharoCOM-Variant-Types'
}

{ #category : #accessing }
Win32VariantDecimal >> readFrom: aVariant [
	| hi mid lo sign scale value |
	hi := aVariant rawData platformUnsignedLongAt: -3.
	mid := aVariant rawData platformUnsignedLongAt: 5.
	lo := aVariant rawData platformUnsignedLongAt: 1.
	sign := aVariant rawData unsignedByteAt: -4.
	scale := aVariant rawData unsignedByteAt: -5.
	
	value := hi asScaledDecimal * 16r100000000.
	value := value + (mid asScaledDecimal * 16r10000).
	value := value + lo.
	(sign = 0) ifFalse: [value := value * -1].
	value setNumerator: value numerator denominator: (10 raisedTo: scale) scale: scale.

	^ value 
]

{ #category : #accessing }
Win32VariantDecimal >> write: aValue to: aVariant [
	nil 
]
