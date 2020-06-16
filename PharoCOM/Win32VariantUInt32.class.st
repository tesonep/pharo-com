Class {
	#name : #Win32VariantUInt32,
	#superclass : #Win32VariantType,
	#category : #'PharoCOM-Variant-Types'
}

{ #category : #'as yet unclassified' }
Win32VariantUInt32 >> checkIfElementaryTypeAndWrite: aValue to: aVariant [
	self write: aValue to: aVariant
]

{ #category : #accessing }
Win32VariantUInt32 >> readFrom: aVariant [
	^ 	aVariant rawData integerAt: 1 size: 4 signed: false
]

{ #category : #accessing }
Win32VariantUInt32 >> write: aValue to: aVariant [
	aVariant vt: self typeNumber.
	aVariant rawData integerAt: 1 put: aValue size: 4 signed: false
]
