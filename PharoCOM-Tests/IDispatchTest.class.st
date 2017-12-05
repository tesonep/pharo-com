Class {
	#name : #IDispatchTest,
	#superclass : #TestCase,
	#category : 'PharoCOM-Tests'
}

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
]

{ #category : #tests }
IDispatchTest >> testCallingVoidFunction [
	| obj |
	
	Ole32Lib uniqueInstance initLibrary.
	obj := COMDispatchInstance createInstanceByName: 'InternetExplorer.Application'.

	obj dispatch: #Quit.
]
