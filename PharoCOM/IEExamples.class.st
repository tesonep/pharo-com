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
	
	obj := COMDispatchInstance createInstanceOf: '{0002DF01-0000-0000-C000-000000000046}' "InternetExplorer".
	obj propertyNamed: #Visible put: true.
]
