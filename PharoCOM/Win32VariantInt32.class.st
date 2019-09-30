Class {
	#name : #Win32VariantInt32,
	#superclass : #Win32VariantType,
	#category : #'PharoCOM-Variant-Types'
}

{ #category : #'as yet unclassified' }
Win32VariantInt32 >> checkElementaryTypeAndWrite: aValue to: aVariant [
	aValue asWin32VariantInto: aVariant
]

{ #category : #accessing }
Win32VariantInt32 >> readFrom: aVariant [
	^ aVariant rawData signedLongAt: 1.
]

{ #category : #accessing }
Win32VariantInt32 >> write: aValue to: aVariant [
	aVariant vt: self typeNumber.
	aVariant rawData signedLongAt: 1 put: aValue.
]
