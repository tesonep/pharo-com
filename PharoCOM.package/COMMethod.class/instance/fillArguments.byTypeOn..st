invoking
fillArguments: arguments byTypeOn: dispparams
	arguments doWithIndex: [ :value :idx | |type variant|
		type := self parameterTypes at: idx.
		variant := dispparams argsArray at: idx.
		variant vt: type typeNumber.
		type write: value to: variant 
	]