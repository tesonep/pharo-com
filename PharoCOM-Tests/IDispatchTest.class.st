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
IDispatchTest >> testADODBConnection [
	| conn state |
	self isCI ifTrue: [ ^self skip ]. "CI detect"

	Ole32Lib uniqueInstance initLibrary.
	conn := COMDispatchInstance createInstanceByName: 'ADODB.Connection' .
	conn dispatch: 'Open' withArguments: { 'connection string;' . 'username' . 'password' } .
	state := conn propertyNamed: 'State' .
	conn dispatch: 'Close'.
	conn finalize.
	self assert: state equals: 1.

]

{ #category : #tests }
IDispatchTest >> testADODBConnectionAndRecordset [
	| conn rst recordCount |
	self isCI ifTrue: [ ^self skip ]. "CI detect"

	Ole32Lib uniqueInstance initLibrary.
	conn := COMDispatchInstance createInstanceByName: 'ADODB.Connection' .
	conn dispatch: 'Open' withArguments: { 'connection string;' . 'username' . 'password'  } .  
	rst := COMDispatchInstance createInstanceByName: 'ADODB.Recordset' .
	rst dispatch: 'Open' withArguments: { 'Table name or SQL SELECT' . 	conn . 3 . 1 } . 
	recordCount := rst propertyNamed: 'RecordCount'.  
	rst dispatch: 'Close'.
	conn dispatch: 'Close'.
	rst finalize.
	conn finalize.
	self assert: recordCount  equals: 14566 "<-- change to number of records"

]

{ #category : #tests }
IDispatchTest >> testADODBRecordset [
	| rst recordCountLoop recordCountReported |
	self isCI ifTrue: [ ^self skip ]. "CI detect"

	Ole32Lib uniqueInstance initLibrary.
	rst := COMDispatchInstance createInstanceByName: 'ADODB.Recordset' .
	rst dispatch: 'Open' withArguments: { 
		'Table name or SQL SELECT' . 
		'connection string including authentication details (usrn pwd)' . 
		3 .   "<-- CursorType adOpenStatic"
		1 } . "<-- LockType adLockReadOnly"
	recordCountLoop := 0.
	[ rst propertyNamed: 'EOF' ] whileFalse: [ 
		recordCountLoop := recordCountLoop + 1.
		rst dispatch: 'MoveNext'
	 ].
	recordCountReported := rst propertyNamed: 'RecordCount'.  
	rst dispatch: 'Close'.
	rst finalize.
	self assert: recordCountLoop  equals: recordCountReported


]

{ #category : #tests }
IDispatchTest >> testAccess [
	| access oneModule |
	self isCI ifTrue: [ ^self skip ]. "CI detect"

	Ole32Lib uniqueInstance initLibrary.
	
	access := COMDispatchInstance createInstanceByName: 'Access.Application'.
	access propertyNamed: 'Visible' put: true. 
	access dispatch: 'OpenCurrentDatabase' withArguments: { 'C:\Users\santiago\Documents\Northwind.accdb' }.
	
	self halt. 
	
	"a COMDispatchInstance(@ 16r00D791E8)"
access propertyNamed: 'CurrentProject'.

(access propertyNamed: 'DoCmd') dispatch: 'OpenForm' withArguments: { 'Purchase Order Details' . 1 }.
access propertyNamed: 'Modules'.

(access propertyNamed: 'Modules') propertyNamed: 'Count'.

oneModule := (access propertyNamed: 'Modules')  propertyNamed: 'Item' withArguments: { 0 }.
oneModule propertyNamed: 'Lines' withArguments: { 1 . 100 }.

(access propertyNamed: 'DoCmd') dispatch: 'OpenModule' withArguments: { 'Inventory' }.

(access propertyNamed: 'Modules') propertyNamed: 'Item' withArguments: { 0 }.
	
	
	access dispatch: 'Quit'.
	access finalize. 
	
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
IDispatchTest >> testWord [
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
