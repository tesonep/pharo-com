Class {
	#name : #Win32VariantByte,
	#superclass : #Win32VariantType,
	#category : #'PharoCOM-Variant-Types'
}

{ #category : #accessing }
Win32VariantByte >> checkIfElementaryTypeAndWrite: aValue to: aVariant [
	self write: aValue to: aVariant
]

{ #category : #accessing }
Win32VariantByte >> readFrom: aWin32Variant [
	^ aWin32Variant rawData integerAt: 1 size: 1 signed: true
]

{ #category : #accessing }
Win32VariantByte >> write: aValue to: aVariant [
	aVariant vt: self typeNumber.
	aVariant rawData integerAt: 1 put: aValue size: 1 signed: true
]
