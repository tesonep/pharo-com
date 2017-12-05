"
I am a class with a bunch of examples in the class side.
"
Class {
	#name : #IEExamples,
	#superclass : #Object,
	#category : 'PharoCOM-Examples'
}

{ #category : #'as yet unclassified' }
IEExamples class >> exampleShowingPharoPage [
	| obj |
	
	obj := COMDispatchInstance createInstanceByName: 'InternetExplorer.Application'.
	obj propertyNamed: #Visible put: true.
	obj inspect.
]
