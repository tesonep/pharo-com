Class {
	#name : #Win32VariantCurrency,
	#superclass : #Win32VariantType,
	#category : #'PharoCOM-Variant-Types'
}

{ #category : #'as yet unclassified' }
Win32VariantCurrency >> checkIfElementaryTypeAndWrite: aValue to: aVariant [
	self write: aValue to: aVariant
]

{ #category : #accessing }
Win32VariantCurrency >> readFrom: aVariant [
	^ 	aVariant rawData integerAt: 1 size: 8 signed: true
]

{ #category : #accessing }
Win32VariantCurrency >> write: aValue to: aVariant [
	aVariant vt: self typeNumber.
	aVariant rawData integerAt: 1 put: aValue size: 8 signed: true
]
