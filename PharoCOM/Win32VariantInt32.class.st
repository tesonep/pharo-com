Class {
	#name : #Win32VariantInt32,
	#superclass : #Win32VariantType,
	#category : 'PharoCOM-Variant-Types'
}

{ #category : #accessing }
Win32VariantInt32 >> readFrom: aVariant [
	^ aVariant rawData signedLongAt: 1.
]

{ #category : #accessing }
Win32VariantInt32 >> write: aValue to: aVariant [
	aVariant rawData signedLongAt: 1 put: aValue.
]
