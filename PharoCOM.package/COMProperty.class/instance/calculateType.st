calculating members
calculateType
	setter ifNotNil:[ ^ setter parameterTypes first ].

	getter ifNotNil:[ ^ getter returnType ].
