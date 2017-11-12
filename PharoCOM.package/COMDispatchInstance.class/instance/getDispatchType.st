querying
getDispatchType
	^ (dispatchType isNil or: [ dispatchType isNull ])
		ifTrue: [ dispatchType := self getTypeInfo dispatchInterface ]
		ifFalse: [ dispatchType ]