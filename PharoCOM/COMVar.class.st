Class {
	#name : #COMVar,
	#superclass : #Object,
	#instVars : [
		'name',
		'varKind',
		'memberId',
		'value'
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
	value := aCOMVarDesc lpvarValue read.
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
COMVar >> value [

	^ value
]
