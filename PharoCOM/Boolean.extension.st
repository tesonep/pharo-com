Extension { #name : #Boolean }

{ #category : #'*PharoCOM' }
Boolean >> asWin32VariantInto: aVariant [
	| type | 
	type := Win32Variant typeFor: 11. "<-- can this be done with #BOOL and TypeMapping?"
	type write: self to: aVariant
]
