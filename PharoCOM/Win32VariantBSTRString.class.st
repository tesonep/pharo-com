Class {
	#name : #Win32VariantBSTRString,
	#superclass : #Win32VariantType,
	#category : #'PharoCOM-Variant-Types'
}

{ #category : #accessing }
Win32VariantBSTRString >> readFrom: aVariant [
	| bstrStr str |
	
	(aVariant rawData pointerAt: 1) isNull ifTrue: [ ^ ''].
	
	bstrStr := BSTRString fromHandle: (aVariant rawData pointerAt: 1).
	str := bstrStr asString.
	bstrStr finalize.
		
	^ str .
]

{ #category : #accessing }
Win32VariantBSTRString >> write: aValue to: aVariant [
	| bstr |
	bstr := BSTRString fromString: aValue.
	aVariant rawData pointerAt: 1 put: bstr handle.
]
