Class {
	#name : #COMErrorOnDiscoveryTest,
	#superclass : #TestCase,
	#instVars : [
		'subject'
	],
	#category : #'PharoCOM-Tests'
}

{ #category : #running }
COMErrorOnDiscoveryTest >> setUp [
	[ self error: 'Forced error ' ]
		on: Error
		do: [ :err | subject := COMErrorOnDiscovery new setError: err ]
]

{ #category : #running }
COMErrorOnDiscoveryTest >> shouldRaiseExpectedError: aBlock [
	| flag |
	flag := false.
	[ aBlock value ]
		on: Error
		do: [ :err | 
			flag := err messageText
				beginsWith:
					'This property / function has not being discover due to the wrapped error: ' ].
	self assert: flag
]

{ #category : #running }
COMErrorOnDiscoveryTest >> testGetFromFails [
	self shouldRaiseExpectedError:[ subject getFrom: nil ]
]

{ #category : #running }
COMErrorOnDiscoveryTest >> testGetFromWithArgumentsFails [
	self shouldRaiseExpectedError:[ subject getFrom: nil withArguments: nil ]
]

{ #category : #running }
COMErrorOnDiscoveryTest >> testInvokeWithArgumentsFails [
	self shouldRaiseExpectedError:[ subject invokeOn: nil withArgs: nil ]
]

{ #category : #running }
COMErrorOnDiscoveryTest >> testIsFunction [ 
	self assert: subject isFunction  
]

{ #category : #running }
COMErrorOnDiscoveryTest >> testIsNotGet [
	self deny: subject isGet 
]

{ #category : #running }
COMErrorOnDiscoveryTest >> testIsNotProperty [ 
	self deny: subject isProperty  
]

{ #category : #running }
COMErrorOnDiscoveryTest >> testIsNotPut [
	self deny: subject isPut 
]

{ #category : #running }
COMErrorOnDiscoveryTest >> testMessagesExpectedByTheUIAreProperlyPatched [
	" This is not nice. This is why is tested. "
	self assert: subject parametersWithType equals: {'Error'}.
	self assert: subject returnType equals: subject.
	self assert: subject typeName equals: 'Error'.
	self assert: subject memberId equals: 'Error'.
	self assert: subject invokeKind equals: subject.
	self assert: subject item equals: 'Error'
]
