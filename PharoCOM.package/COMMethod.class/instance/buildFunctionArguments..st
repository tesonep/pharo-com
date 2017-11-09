invoking
buildFunctionArguments: arguments
	| dispparams namedArgs |
	
	"Special named parameters for the PUT in a property"
	namedArgs := self invokeKind = COMInvokeKind Put
		ifTrue: [ #(-3) ]
		ifFalse: [ #() ].
	
	dispparams := COMDispParams
		externalForSize: arguments size
		namedArgs: namedArgs.
	
	self fillArguments: arguments byTypeOn: dispparams.
		
	^ dispparams