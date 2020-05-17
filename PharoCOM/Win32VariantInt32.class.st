Class {
	#name : #Win32VariantInt32,
	#superclass : #Win32VariantType,
	#category : #'PharoCOM-Variant-Types'
}

{ #category : #'as yet unclassified' }
Win32VariantInt32 >> checkIfElementaryTypeAndWrite: aValue to: aVariant [
	self write: aValue to: aVariant
]

{ #category : #accessing }
Win32VariantInt32 >> readFrom: aVariant [
	^ 	aVariant rawData integerAt: 1 size: 4 signed: true
]

{ #category : #accessing }
Win32VariantInt32 >> write: aValue to: aVariant [
	aVariant vt: self typeNumber.
	aVariant rawData integerAt: 1 put: aValue size: 4 signed: true
]
