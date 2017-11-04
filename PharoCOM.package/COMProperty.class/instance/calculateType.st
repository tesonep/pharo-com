calculating members
calculateType
	setter ifNotNil:[
		^ setter parameterTypes first.
	].

	getter ifNotNil:[
		^ getter parameterTypes first truncateTo: (getter parameterTypes first size) - 1.
	].
