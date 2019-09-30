Class {
	#name : #TDD,
	#superclass : #TestCase,
	#category : #'PharoCOM-Tests-Tomaz'
}

{ #category : #tests }
TDD >> testADODB [
	| conn rst state noRecs |
	Ole32Lib uniqueInstance initLibrary.
	rst := COMDispatchInstance createInstanceByName: 'ADODB.Recordset' .
	rst dispatch: 'Open' withArguments: { 
		2 .
		1 .
		3 .
		'DSN=ISLOVAR; Uid=Islovar30; Pwd=informatika01;' . 
		'Term' } . 
	rst propertyNamed: 'RecordCount'.



	conn := COMDispatchInstance createInstanceByName: 'ADODB.Connection' .
	conn dispatch: 'Open' withArguments: { 'DSN=ISLOVAR; Uid=Islovar30; Pwd=informatika01;' } .
	state := conn propertyNamed: 'State' .
	rst := conn dispatch: 'OpenSchema' withArguments: { 20 }.
	noRecs := rst propertyNamed: 'RecordCount'.


	Win32Variant typeFor: 72.


	rst dispatch: 'Open' withArguments: { 'Term' . conn . 3 . 1 }.


	ClyFullBrowser openOnClass: Win32Variant class selector: #initializeTypeMapping .


]

{ #category : #tests }
TDD >> testWord [
	| wrd docs sel |
	Ole32Lib uniqueInstance initLibrary.
	wrd := COMDispatchInstance createInstanceByName: 'Word.Application'.
	wrd propertyNamed: 'Visible' put: true. 
	docs := wrd propertyNamed: 'Documents'.
	docs dispatch: 'Add'.
	sel := wrd propertyNamed: 'Selection'. 
	sel dispatch: 'TypeText' withArguments: {'ČĆŽŠĐ čćžšđ'}.
	sel dispatch: 'WholeStory' .
	Transcript show: (sel propertyNamed: 'Text'); cr.

]
