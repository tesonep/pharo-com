Extension { #name : #ScaledDecimal }

{ #category : #'*PharoCOM' }
ScaledDecimal >> asWin32VariantInto: aVariant [
	| type | 
	type := Win32Variant typeFor: 14. "<-- can this be done with #DECIMAL and TypeMapping?"
	type write: self to: aVariant
]
