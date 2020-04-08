Class {
	#name : #ADODBConnectionTest,
	#superclass : #IDispatchTest,
	#category : #'PharoCOM-Tests'
}

{ #category : #tests }
ADODBConnectionTest >> testADODBConnection [
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
ADODBConnectionTest >> testADODBConnectionAndRecordset [
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
ADODBConnectionTest >> testADODBRecordset [
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
