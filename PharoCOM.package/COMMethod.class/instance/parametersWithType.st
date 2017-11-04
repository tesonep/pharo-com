printing
parametersWithType
	^ parameterTypes with: parameterNames collect: [ :paramType :paramName | 
		((self optionalParameters includes: paramName) ifTrue:'[OPT] ' ifFalse:'') ,
		paramType , ' ' , paramName ].