instance initalization
named: aName on: aTypeInfo 
	self name: aName.
	getter := aTypeInfo methods detect: [ :e | e isGet and: [ e name = aName ] ] ifNone: nil.
	setter := aTypeInfo methods detect: [ :e | e isPut and: [ e name = aName ] ] ifNone: nil.	
	type := self calculateType.