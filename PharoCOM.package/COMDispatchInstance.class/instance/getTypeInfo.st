querying
getTypeInfo
	(typeInfo isNil or: [ typeInfo isNull ])
		ifTrue: [ typeInfo := self getTypeInfo: 0 lcid: LOCALE_USER_DEFAULT ].

	^ typeInfo