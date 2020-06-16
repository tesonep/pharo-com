Class {
	#name : #Win32VariantUInt16,
	#superclass : #Win32VariantType,
	#category : #'PharoCOM-Variant-Types'
}

{ #category : #accessing }
Win32VariantUInt16 >> checkIfElementaryTypeAndWrite: aValue to: aVariant [
	self write: aValue to: aVariant
]

{ #category : #accessing }
Win32VariantUInt16 >> readFrom: aVariant [
	^ 	aVariant rawData integerAt: 1 size: 2 signed: false
]

{ #category : #accessing }
Win32VariantUInt16 >> write: aValue to: aVariant [
	aVariant vt: self typeNumber.
	aVariant rawData integerAt: 1 put: aValue size: 2 signed: false
]
