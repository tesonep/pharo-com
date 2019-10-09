Class {
	#name : #VariantsTests,
	#superclass : #TestCase,
	#category : #'PharoCOM-Tests'
}

{ #category : #tests }
VariantsTests >> testDate [ 
	| variant type valuePut valueGet  |
	valuePut := DateAndTime now truncated.
	
	variant := Win32Variant externalNew .
	variant autoRelease .
	variant init.

	type := Win32Variant typeFor: 7. "<-- date"
	variant vt: type typeNumber .
	type write: valuePut to: variant.
	
	valueGet := (type readFrom: variant) offset: (Duration hours: 2).
	self assert: valueGet equals: valuePut.
	
	valueGet := (type readFrom: variant).
	self assert: valueGet equals: valuePut.
]

{ #category : #tests }
VariantsTests >> testDecimal [
	| variant type valuePut valueGet  |
	valuePut := 12345.54321 asScaledDecimal: 4.
	
	variant := Win32Variant externalNew .
	variant autoRelease .
	variant init.

	type := Win32Variant typeFor: 14. "<-- decimal"
	variant vt: type typeNumber .
	type write: valuePut to: variant.
	
	valueGet := type readFrom: variant.
	self assert: (valuePut round: 4) equals: (valueGet round: 4)
]

{ #category : #tests }
VariantsTests >> testDouble [
	| variant type valuePut valueGet  |
	valuePut := 12345.54321. 
	
	variant := Win32Variant externalNew .
	variant autoRelease .
	variant init.

	type := Win32Variant typeFor: 5. "<-- double"
	variant vt: type typeNumber .
	type write: valuePut to: variant.
	
	valueGet := type readFrom: variant.
	self assert: valuePut equals: valueGet
]

{ #category : #tests }
VariantsTests >> testNull [
	| variant type valuePut valueGet  |
	valuePut := 'anything'.

	variant := Win32Variant externalNew .
	variant autoRelease .
	variant init.

	type := Win32Variant typeFor: 1. "<-- null"
	variant vt: type typeNumber .
	type write: valuePut to: variant.
	
	valueGet := type readFrom: variant.
	self assert: valueGet equals: nil
]
