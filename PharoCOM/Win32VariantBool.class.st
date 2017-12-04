Class {
	#name : #Win32VariantBool,
	#superclass : #Win32VariantType,
	#category : 'PharoCOM-Variant-Types'
}

{ #category : #accessing }
Win32VariantBool >> readFrom: aVariant [
	^ (aVariant data at: 1) = 16rff and: [ (aVariant data at: 2) = 16rff ]
]

{ #category : #accessing }
Win32VariantBool >> write: aValue to: aVariant [
	aValue
		ifTrue: [ 
			aVariant data at: 1 put: 16rFF.
			aVariant data at: 2 put: 16rFF ]
		ifFalse: [ 
			aVariant data at: 1 put: 0.
			aVariant data at: 2 put: 0 ]
]
