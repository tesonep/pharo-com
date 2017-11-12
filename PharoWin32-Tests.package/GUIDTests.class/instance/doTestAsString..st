tests
doTestAsString: original
	| guid |
	guid := GUID fromString: original.
	self assert: guid asString equals: original