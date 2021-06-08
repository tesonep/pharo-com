Class {
	#name : #COMVar,
	#superclass : #Object,
	#instVars : [
		'name',
		'varKind',
		'memberId',
		'value',
		'typeName'
	],
	#category : #'PharoCOM-TypeLibraries'
}

{ #category : #'instance creation' }
COMVar class >> fromFuncDesc: aCOMVarDesc in: aCOMTypeInfo [

	^ self new
		  from: aCOMVarDesc in: aCOMTypeInfo;
		  yourself
]

{ #category : #'instance creation' }
COMVar >> from: aCOMVarDesc in: aCOMTypeInfo [

	name := (aCOMTypeInfo
		         getNamesOfMemberID: aCOMVarDesc memid
		         maxNames: 1) first.
	varKind := aCOMVarDesc varkind item.
	memberId := aCOMVarDesc memid.
	aCOMVarDesc hasValueToRead
		ifTrue: [ value := aCOMVarDesc lpvarValue read ]
		ifFalse: [ 
		typeName := aCOMVarDesc elemdescVar calculateType typeName ]
]

{ #category : #accessing }
COMVar >> name [
	^ name
]

{ #category : #'instance creation' }
COMVar >> printOn: aStream [

	aStream
		nextPutAll: 'COMVar(';
		nextPutAll: name;
		nextPutAll: ':';
		nextPutAll: varKind;
		nextPutAll: ' = ';
		nextPutAll: value asString;
		nextPutAll: ')'
]

{ #category : #'instance creation' }
COMVar >> typeName [
	^ typeName
]

{ #category : #'instance creation' }
COMVar >> value [

	^ value
]

{ #category : #accessing }
COMVar >> varKind [
	^ varKind
]
