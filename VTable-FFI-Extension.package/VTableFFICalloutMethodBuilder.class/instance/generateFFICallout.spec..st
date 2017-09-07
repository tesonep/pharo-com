private
generateFFICallout: builder spec: functionSpec
	"Builds a method call"
	builder
		numArgs: self method argumentNames size;
		addTemps: (self method argumentNames copyWith: #result).
	"modify the ffi call with the table position"

	builder pushReceiver.
	"save ffi call as literal"
	builder pushLiteral: (self createFFICalloutLiteralFromSpec: functionSpec).
	builder pushLiteral: (self calloutAPI tablePosition).
	builder send:#modifyFFICall:withTablePosition:.
	
	"iterate arguments in order (in the function) to create the function call"
	functionSpec arguments
		do: [ :each | each emitArgument: builder context: sender ].
	"create the array"
	builder pushConsArray: functionSpec arguments size.
	"send call and store into result"
	builder send: #invokeWithArguments:.
	functionSpec arguments
		do: [ :each | each emitReturnArgument: builder context: sender ].
	"convert in case return type needs it. And return reseult"
	^ functionSpec returnType
		emitReturn: builder
		resultTempVar: #result
		context: sender