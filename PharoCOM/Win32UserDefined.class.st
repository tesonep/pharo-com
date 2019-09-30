Class {
	#name : #Win32UserDefined,
	#superclass : #Win32VariantType,
	#category : #'PharoCOM-Variant-Types'
}

{ #category : #'as yet unclassified' }
Win32UserDefined >> checkElementaryTypeAndWrite: aValue to: aVariant [
	aValue asWin32VariantInto: aVariant
]
