invoking
invokeOn: anObject withArgs: arguments
	| result returnedValue flags dispparams exceptionInfo argumentError|
	flags := 0.
	argumentError := UINT_PTR new.
	
	returnedValue := Win32Variant externalNew.
	returnedValue autoRelease. 
	
	exceptionInfo := COMExcepInfo externalNew.
	exceptionInfo autoRelease. 

	dispparams := COMDispParams externalEmpty.

	result := self typeInfo
		ffiInvokeOn: anObject
		memberId: self memberId
		flags: flags
		params: dispparams
		resultHolder: returnedValue
		exceptionInfo: exceptionInfo
		argumentError: argumentError.
	
	(result ~= 0) ifTrue: [self reportError: result].
		
	^ returnedValue