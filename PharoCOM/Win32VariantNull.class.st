Class {
	#name : #Win32VariantNull,
	#superclass : #Win32VariantType,
	#category : #'PharoCOM-Variant-Types'
}

{ #category : #'as yet unclassified' }
Win32VariantNull >> checkIfElementaryTypeAndWrite: aValue to: aVariant [
	self write: aValue to: aVariant
]

{ #category : #accessing }
Win32VariantNull >> readFrom: aVariant [
	^ nil 
]

{ #category : #accessing }
Win32VariantNull >> write: aValue to: aVariant [
	aVariant vt: self typeNumber. 
]
