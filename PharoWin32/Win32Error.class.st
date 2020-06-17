"
""
	returnCode 0x80020009 (2147614729)
	 Is an error that is really generic. Is not related to some error that can be easily understood nor managed. 
	Some times is related with some domain configuration or unexpected state for the related operation. 
	

	""
"
Class {
	#name : #Win32Error,
	#superclass : #Error,
	#instVars : [
		'lastErrorCode',
		'returnCode'
	],
	#classInstVars : [
		'anErrorCode',
		'errorCode'
	],
	#category : #'PharoWin32-Error'
}

{ #category : #accessing }
Win32Error class >> returnCode: aReturnCode lastErrorCode: aLastErrorCode [
	self new
		returnCode: aReturnCode lastErrorCode: aLastErrorCode;
		signal
]

{ #category : #accessing }
Win32Error >> isError0x80020009 [
	^ returnCode = 16r80020009
	"
	returnCode 0x80020009 (2147614729)
	 Is an error that is really generic. Is not related to some error that can be easily understood nor managed. 
	Some times is related with some domain configuration or unexpected state for the related operation. 
	

	"
]

{ #category : #accessing }
Win32Error >> loadWin32ErrorMessage [
	| errorMessage |
	errorMessage := Kernel32Lib uniqueInstance
		lookupMessage:
			(returnCode = 0
				ifTrue: [ lastErrorCode ]
				ifFalse: [ returnCode ]).
	^ String
		streamContents: [ :s | 
			s
				nextPutAll: errorMessage;
				nextPutAll: ' (';
				nextPutAll: returnCode hex printString;
				nextPut: $:;
				nextPutAll: lastErrorCode printString;
				nextPut: $) ]
]

{ #category : #accessing }
Win32Error >> messageText [
	^ messageText ifNil: [ messageText := self loadWin32ErrorMessage ]
]

{ #category : #accessing }
Win32Error >> passIfNotError0x80020009 [
	^ self isError0x80020009
		ifFalse: [ self pass ]
]

{ #category : #accessing }
Win32Error >> returnCode: aReturnCode lastErrorCode: aLastErrorCode [
	lastErrorCode := aLastErrorCode.
	returnCode := aReturnCode
]
