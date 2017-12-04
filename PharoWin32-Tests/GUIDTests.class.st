Class {
	#name : #GUIDTests,
	#superclass : #TestCase,
	#category : 'PharoWin32-Tests'
}

{ #category : #tests }
GUIDTests >> doTestAsString: original [
	| guid |
	guid := GUID fromString: original.
	self assert: guid asString equals: original
]

{ #category : #tests }
GUIDTests >> testAsString [
	self doTestAsString: '{0002DF01-0000-0000-C000-000000000046}'.
	self doTestAsString: '{00000000-0000-0000-0000-000000000000}'.

	self doTestAsString: '{FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF}'.
	self doTestAsString: '{00000001-0001-0001-0101-010101010101}'.

]

{ #category : #tests }
GUIDTests >> testCopy [
	| original guid copy |
	original := '{0002DF01-0000-0000-C000-000000000046}'.
	guid := GUID fromString: original.
	copy := guid copy.
	self assert: copy asString equals: original
]
