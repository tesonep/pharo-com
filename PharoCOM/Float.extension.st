Extension { #name : #Float }

{ #category : #'*PharoCOM' }
Float >> asWin32VariantInto: aVariant [
	| type | 
	type := Win32Variant typeFor: 5. "<-- can this be done with #double and TypeMapping?"
	type write: self to: aVariant
]
