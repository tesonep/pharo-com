Extension { #name : #String }

{ #category : #'*PharoCOM' }
String >> asWin32VariantInto: aVariant [
	| type | 
	type := Win32Variant typeFor: 8. "<-- can this be done with #BSTRString and TypeMapping?"
	type write: self to: aVariant
]
