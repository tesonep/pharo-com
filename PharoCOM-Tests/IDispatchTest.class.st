Class {
	#name : #IDispatchTest,
	#superclass : #TestCase,
	#category : #'PharoCOM-Tests'
}

{ #category : #testing }
IDispatchTest >> isCI [
	^ (OSEnvironment current at: 'CI' ifAbsent: [ 'false' ]) asLowercase = 'true' 
]

{ #category : #tests }
IDispatchTest >> testAccessingBoolProperties [
	| obj value |
	Ole32Lib uniqueInstance initLibrary.

	obj := COMDispatchInstance createInstanceByName: 'InternetExplorer.Application'.

	value := obj propertyNamed: #Resizable.
	self assert: value equals: true.

	value := obj propertyNamed: #Visible.
	self assert: value equals: false.

	obj propertyNamed: #Resizable put: false.

	(Delay forSeconds: 2) wait.

	value := obj propertyNamed: #Resizable.
	self assert: value equals: false.

	obj dispatch: #Quit.
	obj finalize.
]

{ #category : #tests }
IDispatchTest >> testAccessingInt32Properties [
	| obj value |
	Ole32Lib uniqueInstance initLibrary.

	obj := COMDispatchInstance createInstanceByName: 'InternetExplorer.Application'.
	
	obj propertyNamed: #Left put: 250.	
	value := obj propertyNamed: #Left.
	
	self assert: 250 equals: value.
	
	obj dispatch: #Quit.
	obj finalize.
]

{ #category : #tests }
IDispatchTest >> testCallingVoidFunction [
	| obj |
	
	Ole32Lib uniqueInstance initLibrary.
	obj := COMDispatchInstance createInstanceByName: 'InternetExplorer.Application'.

	obj dispatch: #Quit.
	obj finalize.

]

{ #category : #tests }
IDispatchTest >> testInvoking2ArgumentMethod [
	| obj |
	Ole32Lib uniqueInstance initLibrary.

	obj := COMDispatchInstance createInstanceByName: 'InternetExplorer.Application'.
	
	obj dispatch: #PutProperty withArguments: { 'aProperty'. 42 }.
	self assert: (obj dispatch: #GetProperty withArguments: { 'aProperty'.}) equals: 42.
		
	obj dispatch: #Quit.
	obj finalize.
]
