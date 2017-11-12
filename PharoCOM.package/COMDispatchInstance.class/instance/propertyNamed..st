properties
propertyNamed: aPropName 
	| prop |
	prop := self getDispatchType properties detect: [ :e | e name = aPropName ].
	^ prop getFrom: self.