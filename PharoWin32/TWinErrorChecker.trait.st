Trait {
	#name : 'TWinErrorChecker',
	#category : 'PharoWin32',
	#package : 'PharoWin32'
}

{ #category : 'reporting errors' }
TWinErrorChecker >> reportError: aErrorCode [
	Kernel32Lib uniqueInstance reportError: aErrorCode
]

{ #category : 'reporting errors' }
TWinErrorChecker >> reportError: aErrorCode ifNone: anArray [
	(anArray includes: aErrorCode)
		ifFalse:  [ self reportError: aErrorCode ]
]

{ #category : 'reporting errors' }
TWinErrorChecker >> reportError: aErrorCode ifSome: anArray [
	(anArray includes: aErrorCode)
		ifTrue:  [ self reportError: aErrorCode ]
]

{ #category : 'reporting errors' }
TWinErrorChecker >> reportErrorIfNoZero: aErrorCode [
	self reportError: aErrorCode ifNone: { 0 }
]

{ #category : 'reporting errors' }
TWinErrorChecker >> reportErrorIfZero: aErrorCode [
	self reportError: aErrorCode ifSome: { 0 }
]
