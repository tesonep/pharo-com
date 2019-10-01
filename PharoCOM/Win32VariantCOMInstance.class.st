Class {
	#name : #Win32VariantCOMInstance,
	#superclass : #Win32VariantType,
	#category : #'PharoCOM-Variant-Types'
}

{ #category : #'as yet unclassified' }
Win32VariantCOMInstance >> checkIfElementaryTypeAndWrite: aValue to: aVariant [
	self write: aValue to: aVariant
]

{ #category : #accessing }
Win32VariantCOMInstance >> readFrom: aVariant [
	| instance |
	instance := COMDispatchInstance fromHandle: (aVariant rawData pointerAt: 1).
	instance addRef.
	^ instance
]

{ #category : #accessing }
Win32VariantCOMInstance >> write: anInstance to: aVariant [
	aVariant vt: self typeNumber.
	aVariant rawData pointerAt: 1 put: anInstance handle.
	anInstance addRef 
]
