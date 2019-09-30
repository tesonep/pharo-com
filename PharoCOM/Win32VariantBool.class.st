Class {
	#name : #Win32VariantBool,
	#superclass : #Win32VariantType,
	#category : #'PharoCOM-Variant-Types'
}

{ #category : #'as yet unclassified' }
Win32VariantBool >> checkIfElementaryTypeAndWrite: aValue to: aVariant [
	self write: aValue to: aVariant
]

{ #category : #accessing }
Win32VariantBool >> readFrom: aVariant [
	^ (aVariant data at: 1) = 16rff and: [ (aVariant data at: 2) = 16rff ]
]

{ #category : #accessing }
Win32VariantBool >> write: aValue to: aVariant [
	| localData |
	aVariant vt: self typeNumber. 
	localData := aVariant data.
	aValue
		ifTrue: [ 
			localData at: 1 put: 16rFF.
			localData at: 2 put: 16rFF ]
		ifFalse: [ 
			localData at: 1 put: 0.
			localData at: 2 put: 0 ].
	aVariant data: localData
]
