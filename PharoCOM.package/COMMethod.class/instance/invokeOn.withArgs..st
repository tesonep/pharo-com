invoking
invokeOn: anObject withArgs: arguments
	| result returnedValue dispparams exceptionInfo argumentError nullGuid namedArgs |
	argumentError := ExternalAddress allocate: Smalltalk wordSize.
	argumentError autoRelease.
	argumentError unsignedLongAt: 1 put: 0.
	
	returnedValue := Win32Variant externalNew.
	returnedValue autoRelease. 
	
	exceptionInfo := COMExcepInfo externalNew.
	exceptionInfo autoRelease. 

	namedArgs := (self invokeKind = COMInvokeKind Put) ifTrue:[#(-3)] ifFalse:[#()].

	dispparams := COMDispParams externalFor: arguments namedArgs: namedArgs.
	nullGuid := GUID clsidFromString: '{00000000-0000-0000-0000-000000000000}'.
	
	result := anObject
		ffiInvokeMemberId: self memberId
		refiid: nullGuid getHandle
		lcid: LOCALE_USER_DEFAULT
		flags: self invokeKind value 
		params: dispparams getHandle
		resultHolder: returnedValue getHandle 
		exceptionInfo: exceptionInfo getHandle
		argumentError: argumentError.
	
	(result ~= 0) ifTrue: [self reportError: result].
		
	^ returnedValue