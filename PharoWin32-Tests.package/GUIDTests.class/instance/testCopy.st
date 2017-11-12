tests
testCopy
	| original guid copy |
	original := '{0002DF01-0000-0000-C000-000000000046}'.
	guid := GUID fromString: original.
	copy := guid copy.
	self assert: copy asString equals: original