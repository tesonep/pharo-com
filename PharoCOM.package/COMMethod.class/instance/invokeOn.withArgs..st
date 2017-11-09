invoking
invokeOn: anObject withArgs: arguments
	| result returnedValue exceptionInfo argumentError |
	argumentError := ExternalAddress allocate: Smalltalk wordSize.

	argumentError autoRelease.
	argumentError unsignedLongAt: 1 put: 0.

	returnedValue := Win32Variant externalNew.
	returnedValue autoRelease.

	exceptionInfo := COMExcepInfo externalNew.
	exceptionInfo autoRelease.

	result := anObject
		ffiInvokeMemberId: self memberId
		refiid: GUID nullGuid
		lcid: LOCALE_USER_DEFAULT
		flags: self invokeKind value
		params: (self buildFunctionArguments: arguments)
		resultHolder: returnedValue
		exceptionInfo: exceptionInfo
		argumentError: argumentError.

	result ~= 0
		ifTrue: [ self reportError: result ].

	^ returnType isVoid
		ifTrue: [ ^ anObject ]
		ifFalse: [ returnedValue read ]