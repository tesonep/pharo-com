calculating members
calculateProperties
	| propNames |
	
	propNames := ((self methods select: #isProperty) collect: #name) asSet.
	^ propNames collect: [ :e | COMProperty named: e on: self ]
	