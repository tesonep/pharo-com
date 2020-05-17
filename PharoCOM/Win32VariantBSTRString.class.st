Class {
	#name : #Win32VariantBSTRString,
	#superclass : #Win32VariantType,
	#category : #'PharoCOM-Variant-Types'
}

{ #category : #'as yet unclassified' }
Win32VariantBSTRString >> checkIfElementaryTypeAndWrite: aValue to: aVariant [
	self write: aValue to: aVariant
]

{ #category : #accessing }
Win32VariantBSTRString >> readFrom: aVariant [
	| bstrStr str |
	
	(aVariant rawData pointerAt: 1) isNull ifTrue: [ ^ ''].
	"We don't need to release because it is in the variant"	
	bstrStr := BSTRString fromHandle: (aVariant rawData pointerAt: 1).
	str := bstrStr asString.
		
	^ str .
]

{ #category : #accessing }
Win32VariantBSTRString >> write: aValue to: aVariant [
	| bstr |
	aVariant vt: self typeNumber.
	bstr := BSTRString fromString: aValue.
	aVariant rawData pointerAt: 1 put: bstr handle.
]
