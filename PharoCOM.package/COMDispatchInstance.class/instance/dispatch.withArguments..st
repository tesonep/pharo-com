invoking
dispatch: aFunctionName withArguments: arguments 
	| func |
	func := self getDispatchType functions detect:[ :e | e name = aFunctionName ].
	^ func invokeOn: self withArgs: arguments.