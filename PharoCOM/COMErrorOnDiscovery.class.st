"
I am here to represent an error hapened during discovery.  
"
Class {
	#name : #COMErrorOnDiscovery,
	#superclass : #Object,
	#instVars : [
		'error'
	],
	#category : #PharoCOM
}

{ #category : #initialization }
COMErrorOnDiscovery >> getFrom: aObj [
	self informError
]

{ #category : #initialization }
COMErrorOnDiscovery >> getFrom: aObj withArguments: arguments [ 
	self informError
]

{ #category : #initialization }
COMErrorOnDiscovery >> informError [ 
	self error: 'This property / function has not being discover due to the wrapped error: ', error messageText. 
]

{ #category : #accessing }
COMErrorOnDiscovery >> invokeKind [
	^ self 
]

{ #category : #initialization }
COMErrorOnDiscovery >> invokeOn: anObject withArgs: arguments [
	self informError
]

{ #category : #testing }
COMErrorOnDiscovery >> isFunction [
	^ true 
]

{ #category : #testing }
COMErrorOnDiscovery >> isGet [
	^ false 
]

{ #category : #initialization }
COMErrorOnDiscovery >> isProperty [
	^ false 
]

{ #category : #testing }
COMErrorOnDiscovery >> isPut [
	^ false 
]

{ #category : #accessing }
COMErrorOnDiscovery >> item [
	^ 'Error'
]

{ #category : #accessing }
COMErrorOnDiscovery >> memberId [
	^ 'Error'
]

{ #category : #accessing }
COMErrorOnDiscovery >> name [
	^ error messageText 
]

{ #category : #printing }
COMErrorOnDiscovery >> parametersWithType [
	^ { 'Error' }
]

{ #category : #accessing }
COMErrorOnDiscovery >> returnType [
	^ self 
]

{ #category : #initialization }
COMErrorOnDiscovery >> setError: anError [
	error := anError . 
]

{ #category : #accessing }
COMErrorOnDiscovery >> typeName [
	^ 'Error'
]
