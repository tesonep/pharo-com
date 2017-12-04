Class {
	#name : #IDispatchTest,
	#superclass : #TestCase,
	#category : 'PharoCOM-Tests'
}

{ #category : #tests }
IDispatchTest >> testAccessingBoolProperties [
	| obj value |
	COMLib uniqueInstance initLibrary.

	obj := COMDispatchInstance createInstanceOf: '{0002DF01-0000-0000-C000-000000000046}' "InternetExplorer".

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
	COMLib uniqueInstance initLibrary.

	obj := COMDispatchInstance createInstanceOf: '{0002DF01-0000-0000-C000-000000000046}' "InternetExplorer".
	
	obj propertyNamed: #Left put: 250.	
	value := obj propertyNamed: #Left.
	
	self assert: 250 equals: value.
	
	obj dispatch: #Quit.
]

{ #category : #tests }
IDispatchTest >> testCallingVoidFunction [
	| obj |
	
	COMLib uniqueInstance initLibrary.
	obj := COMDispatchInstance createInstanceOf: '{0002DF01-0000-0000-C000-000000000046}' "InternetExplorer".

	obj dispatch: #Quit.
]
