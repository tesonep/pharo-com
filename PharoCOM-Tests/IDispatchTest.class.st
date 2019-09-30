Class {
	#name : #IDispatchTest,
	#superclass : #TestCase,
	#category : #'PharoCOM-Tests'
}

{ #category : #tests }
IDispatchTest >> testADODBConnection [
	| conn state |
	Ole32Lib uniqueInstance initLibrary.
	conn := COMDispatchInstance createInstanceByName: 'ADODB.Connection' .
	conn dispatch: 'Open' withArguments: { 'connection string;' . 'username' . 'password' } .
	state := conn propertyNamed: 'State' .
	conn dispatch: 'Close'.
	self assert: state equals: 1.

]

{ #category : #tests }
IDispatchTest >> testADODBConnectionAndRecordset [
	| conn rst recordCount |
	Ole32Lib uniqueInstance initLibrary.
	conn := COMDispatchInstance createInstanceByName: 'ADODB.Connection' .
	conn dispatch: 'Open' withArguments: { 'connection string;' . 'username' . 'password'  } .  
	rst := COMDispatchInstance createInstanceByName: 'ADODB.Recordset' .
	rst dispatch: 'Open' withArguments: { 'Table name or SQL SELECT' . 	conn . 3 . 1 } . 
	recordCount := rst propertyNamed: 'RecordCount'.  
	rst dispatch: 'Close'.
	conn dispatch: 'Close'.
	self assert: recordCount  equals: 14566 "<-- change to number of records"

]

{ #category : #tests }
IDispatchTest >> testADODBRecordset [
	| rst recordCount |
	Ole32Lib uniqueInstance initLibrary.
	rst := COMDispatchInstance createInstanceByName: 'ADODB.Recordset' .
	rst dispatch: 'Open' withArguments: { 
		'Table name or SQL SELECT' . 
		'connection string including authentication details (usrn pwd)' . 
		3 . 
		1 } . 
	recordCount := rst propertyNamed: 'RecordCount'.  
	rst dispatch: 'Close'.
	self assert: recordCount  equals: 14566   "<-- change to number of records"

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

{ #category : #tests }
IDispatchTest >> testWord [
	| wrd docs sel someText |
	someText := 'Hello from Pharo!'.
	Ole32Lib uniqueInstance initLibrary.
	wrd := COMDispatchInstance createInstanceByName: 'Word.Application'.
	wrd propertyNamed: 'Visible' put: true. 
	docs := wrd propertyNamed: 'Documents'.
	docs dispatch: 'Add'.
	sel := wrd propertyNamed: 'Selection'. 
	sel dispatch: 'TypeText' withArguments: { someText }.
	sel dispatch: 'WholeStory' .
	self assert: (sel propertyNamed: 'Text') allButLast equals: someText.

]
