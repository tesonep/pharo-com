Class {
	#name : #Win32VariantInt16,
	#superclass : #Win32VariantType,
	#category : #'PharoCOM-Variant-Types'
}

{ #category : #accessing }
Win32VariantInt16 >> checkIfElementaryTypeAndWrite: aValue to: aVariant [
	self write: aValue to: aVariant
]

{ #category : #accessing }
Win32VariantInt16 >> readFrom: aVariant [
	^ 	aVariant rawData integerAt: 1 size: 2 signed: true
]

{ #category : #accessing }
Win32VariantInt16 >> write: aValue to: aVariant [
	aVariant vt: self typeNumber.
	aVariant rawData integerAt: 1 put: aValue size: 2 signed: true
]
