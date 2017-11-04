querying
properties
	^ properties ifNil: [ properties := self calculateProperties ]