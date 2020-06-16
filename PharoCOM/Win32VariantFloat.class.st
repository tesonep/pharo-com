Class {
	#name : #Win32VariantFloat,
	#superclass : #Win32VariantType,
	#category : #'PharoCOM-Variant-Types'
}

{ #category : #accessing }
Win32VariantFloat >> checkIfElementaryTypeAndWrite: aValue to: aVariant [
	self write: aValue to: aVariant
]

{ #category : #accessing }
Win32VariantFloat >> readFrom: aVariant [
	^ (aVariant rawData copyFrom: 1 to: 4) floatAt: 1 bigEndian: false.
]

{ #category : #accessing }
Win32VariantFloat >> write: aValue to: aVariant [
	aVariant vt: self typeNumber.
	aVariant rawData floatAt: 1 put: aValue.
]
