querying
methods
	^ methods ifNil: [ methods := self calculateMethods ]