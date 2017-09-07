ffi-calls
ffiCall: fnSpec at: tablePosition
	^ (self ffiCalloutIn: thisContext sender)
		convention: self ffiCallingConvention;
		tablePosition: tablePosition;
		function: fnSpec module: nil