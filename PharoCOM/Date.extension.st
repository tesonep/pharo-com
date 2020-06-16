Extension { #name : #Date }

{ #category : #'*PharoCOM' }
Date >> asWin32VariantInto: aVariant [
	| type | 
	type := Win32Variant typeFor: 7. "<-- can this be done with #DATE and TypeMapping?"
	type write: self to: aVariant
]
