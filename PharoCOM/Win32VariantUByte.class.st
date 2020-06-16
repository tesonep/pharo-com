Class {
	#name : #Win32VariantUByte,
	#superclass : #Win32VariantType,
	#category : #'PharoCOM-Variant-Types'
}

{ #category : #accessing }
Win32VariantUByte >> checkIfElementaryTypeAndWrite: aValue to: aVariant [
	self write: aValue to: aVariant
]

{ #category : #accessing }
Win32VariantUByte >> readFrom: aWin32Variant [
	^ aWin32Variant rawData integerAt: 1 size: 1 signed: false
]

{ #category : #accessing }
Win32VariantUByte >> write: aValue to: aVariant [
	aVariant vt: self typeNumber.
	aVariant rawData integerAt: 1 put: aValue size: 1 signed: false
]
