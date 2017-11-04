querying
getTypeInfo
	(typeInfo isNil or: [ typeInfo isNull ])
		ifTrue: [ typeInfo := self getTypeInfo: 0 lcid: 0 ].

	^ typeInfo