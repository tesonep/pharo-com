properties
propertyNamed: aPropName put: aValue
	| prop |
	prop := self getDispatchType properties detect: [ :e | e name = aPropName ].
	^ prop write: aValue to: self.