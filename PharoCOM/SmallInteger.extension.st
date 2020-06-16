Extension { #name : #SmallInteger }

{ #category : #'*PharoCOM' }
SmallInteger >> asWin32VariantInto: aVariant [
	| type | 
	type := Win32Variant typeFor: 3. "<-- can this be done with #int32 and TypeMapping?"
	type write: self to: aVariant
]
