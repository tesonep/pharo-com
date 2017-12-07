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
	
	obj dispatch: #Navigate withArguments:  {'http://www.pharo.org'}.

	self inform: 'Navigating to:' , (obj propertyNamed: #LocationURL).
	self inform: 'Check the Internet Explorer Window'.

	obj inspect.
]
