Class {
	#name : #Win32VariantDecimal,
	#superclass : #Win32VariantType,
	#category : #'PharoCOM-Variant-Types'
}

{ #category : #'as yet unclassified' }
Win32VariantDecimal >> checkIfElementaryTypeAndWrite: aValue to: aVariant [
	self write: aValue to: aVariant
]

{ #category : #accessing }
Win32VariantDecimal >> readFrom: aVariant [
	| hi mid lo sign scale value |
	hi := aVariant rawData platformUnsignedLongAt: -3.
	mid := aVariant rawData platformUnsignedLongAt: 5.
	lo := aVariant rawData platformUnsignedLongAt: 1.
	sign := aVariant rawData unsignedByteAt: -4.
	scale := aVariant rawData unsignedByteAt: -5.
	
	value := ((hi bitShift: 64) bitOr: (mid bitShift: 32)) bitOr: lo.
	(sign = 0) ifFalse: [value := value negated].
	
	^ ScaledDecimal new setNumerator: value denominator: (10 raisedTo: scale) scale: scale.

]

{ #category : #accessing }
Win32VariantDecimal >> write: aValue to: aVariant [
	| hi mid lo sign scale value |
	aVariant vt: self typeNumber.

	scale := 2.
	(aValue class = ScaledDecimal) 
		ifTrue: [ scale := aValue scale ].
	sign := 0. 
	value := (aValue * (10 raisedToInteger: scale)) rounded. 
	value < 0 ifTrue: [sign := 1. value := value negated]. 

	hi := value bitShift: -64.
	mid := (value bitShift: -32) bitAnd: 16rFFFFFFFF.
	lo := value bitAnd: 16rFFFFFFFF.

	aVariant rawData platformUnsignedLongAt: -3 put: hi.
	aVariant rawData platformUnsignedLongAt: 5 put: mid.
	aVariant rawData platformUnsignedLongAt: 1 put: lo.

	aVariant rawData unsignedByteAt: -4 put: sign.
	aVariant rawData unsignedByteAt: -5 put: scale.
	
]
