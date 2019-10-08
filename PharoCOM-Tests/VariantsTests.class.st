Class {
	#name : #VariantsTests,
	#superclass : #TestCase,
	#category : #'PharoCOM-Tests'
}

{ #category : #tests }
VariantsTests >> testDate [ 
	| variant type valuePut valueGet  |
	valuePut := DateAndTime now.
	
	variant := Win32Variant externalNew .
	variant autoRelease .
	variant init.

	type := Win32Variant typeFor: 7. "<-- boolean"
	variant vt: type typeNumber .
	type write: valuePut to: variant.
	
	valueGet := type readFrom: variant.
	self assert: valuePut equals: valueGet
]
