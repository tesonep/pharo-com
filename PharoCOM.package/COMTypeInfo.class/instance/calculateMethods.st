calculating members
calculateMethods
	| numberOfFunctions typeAttributes all |
	[ typeAttributes := self typeAttributes.
	numberOfFunctions := typeAttributes cFuncs.
	all := OrderedCollection new.

	1 to: numberOfFunctions do: [ :idx | all add: (self calculateMethodAt: idx) ].

	^ all ]
		ensure: [ typeAttributes
				ifNotNil: [ self ffiReleaseTypeAttr: typeAttributes ] ]