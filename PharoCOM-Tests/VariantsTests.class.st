Class {
	#name : #VariantsTests,
	#superclass : #TestCase,
	#category : #'PharoCOM-Tests'
}

{ #category : #testing }
VariantsTests >> isCI [
	^ (OSEnvironment current at: 'CI' ifAbsent: [ 'false' ]) asLowercase = 'true' 
]

{ #category : #tests }
VariantsTests >> testDate [ 
	| variant type valuePut valueGet  |
	self isCI ifTrue: [ ^self skip ]. "CI detect"

	valuePut := Date today.

	variant := Win32Variant externalNew .
	variant autoRelease .
	variant init.

	valuePut asWin32VariantInto: variant.

	type := Win32Variant typeFor: 7. "<-- date"
	
	valueGet := type readFrom: variant.
	self assert: valueGet asDate equals: valuePut asDate.
]

{ #category : #tests }
VariantsTests >> testDateAndTime [ 
	| variant type valuePut valueGet  |
	self isCI ifTrue: [ ^self skip ]. "CI detect"	
	
	valuePut := DateAndTime now truncated. 
	
	variant := Win32Variant externalNew .
	variant autoRelease .
	variant init.

	valuePut asWin32VariantInto: variant.

	type := Win32Variant typeFor: 7. "<-- date"
	
	valueGet := type readFrom: variant.
	self assert: valueGet asDate equals: valuePut asDate.
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
