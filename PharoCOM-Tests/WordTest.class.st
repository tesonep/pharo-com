Class {
	#name : #WordTest,
	#superclass : #IDispatchTest,
	#category : #'PharoCOM-Tests'
}

{ #category : #tests }
WordTest >> testGettingXMLContent [
	| wrd documents doc contents xmlDocument |
	self isCI ifTrue: [ ^self skip ]. "CI detect"

	Ole32Lib uniqueInstance initLibrary.
	
	wrd := COMDispatchInstance createInstanceByName: 'Word.Application'.
	wrd propertyNamed: 'Visible' put: true. 
	documents := wrd propertyNamed: 'Documents'.
	documents dispatch: 'Add'.

	doc := documents dispatch: 'Item' withArguments: { 1 }.
	contents := doc propertyNamed: 'Content'.
	xmlDocument := contents propertyNamed: 'WordOpenXML'.
	
	wrd dispatch: #Quit.
	wrd finalize.
]

{ #category : #tests }
WordTest >> testWord [
	| wrd documents selection someText |
	self isCI ifTrue: [ ^self skip ]. "CI detect"

	someText := 'Hello from Pharo!'.
	
	Ole32Lib uniqueInstance initLibrary.
	
	wrd := COMDispatchInstance createInstanceByName: 'Word.Application'.
	wrd propertyNamed: 'Visible' put: true. 
	documents := wrd propertyNamed: 'Documents'.
	documents dispatch: 'Add'.
	selection := wrd propertyNamed: 'Selection'. 
	selection dispatch: 'TypeText' withArguments: { someText }.
	selection dispatch: 'WholeStory' .
	self assert: (selection propertyNamed: 'Text') allButLast equals: someText.
	
	documents dispatch: 'Add'.
	(wrd propertyNamed: 'Selection') 
		dispatch: 'TypeText' 
		withArguments: { (someText, ' Some additional text.') }.
	(documents dispatch: 'Item' withArguments: { 2 })
		dispatch: 'Activate'.
	selection := wrd propertyNamed: 'Selection'. 
	selection dispatch: 'WholeStory' .

	wrd finalize.
	self assert: (selection propertyNamed: 'Text') allButLast equals: someText.
	
]
