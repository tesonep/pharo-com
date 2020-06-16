Class {
	#name : #Win32VariantDouble,
	#superclass : #Win32VariantType,
	#category : #'PharoCOM-Variant-Types'
}

{ #category : #'as yet unclassified' }
Win32VariantDouble >> checkIfElementaryTypeAndWrite: aValue to: aVariant [
	self write: aValue to: aVariant
]

{ #category : #accessing }
Win32VariantDouble >> readFrom: aVariant [
	^ (aVariant rawData copyFrom: 1 to: 8) doubleAt: 1 bigEndian: false.
]

{ #category : #accessing }
Win32VariantDouble >> write: aValue to: aVariant [
	aVariant vt: self typeNumber.
	aVariant rawData doubleAt: 1 put: aValue.
]
