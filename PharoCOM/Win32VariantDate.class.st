Class {
	#name : #Win32VariantDate,
	#superclass : #Win32VariantType,
	#category : #'PharoCOM-Variant-Types'
}

{ #category : #'as yet unclassified' }
Win32VariantDate >> checkIfElementaryTypeAndWrite: aValue to: aVariant [
	self write: aValue to: aVariant
]

{ #category : #accessing }
Win32VariantDate >> readFrom: aVariant [
	| dateAsFloat |
	dateAsFloat := (aVariant rawData copyFrom: 1 to: 8) doubleAt: 1 bigEndian: false.
	dateAsFloat := dateAsFloat + DateAndTime oleEpoch julianDayNumber - 2.
	^ (DateAndTime julianDayNumber: dateAsFloat) truncated.
]

{ #category : #accessing }
Win32VariantDate >> write: aValue to: aVariant [
	| dateAsFloat seconds |
	aVariant vt: self typeNumber.

	dateAsFloat := aValue julianDayNumber - DateAndTime oleEpoch julianDayNumber + 2.
	seconds := aValue secondsSinceMidnightUTC .
	dateAsFloat := dateAsFloat + (seconds / 86400.0)	.
	
	aVariant rawData doubleAt: 1 put: dateAsFloat.
]
