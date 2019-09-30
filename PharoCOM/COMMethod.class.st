Class {
	#name : #COMMethod,
	#superclass : #Object,
	#traits : 'TWinErrorChecker',
	#classTraits : 'TWinErrorChecker classTrait',
	#instVars : [
		'memberId',
		'name',
		'parameterNames',
		'parameterTypes',
		'returnType',
		'invokeKind',
		'optionalParameters',
		'typeInfo'
	],
	#pools : [
		'COMTypes'
	],
	#category : #PharoCOM
}

{ #category : #'instance creation' }
COMMethod class >> fromFuncDesc: aFuncDesc in: typeInfo [	
	^ self new 
		from: aFuncDesc in: typeInfo;
		yourself.
	
]

{ #category : #invoking }
COMMethod >> buildFunctionArguments: arguments [
	| dispparams namedArgs |
	
	"Special named parameters for the PUT in a property"
	namedArgs := self invokeKind = COMInvokeKind Put
		ifTrue: [ #(-3) ]
		ifFalse: [ #() ].
	
	dispparams := COMDispParams
		externalForSize: arguments size
		namedArgs: namedArgs.
	
	self fillArguments: arguments byTypeOn: dispparams.
		
	^ dispparams
]

{ #category : #invoking }
COMMethod >> fillArguments: arguments byTypeOn: dispparams [
	arguments doWithIndex: [ :value :idx | |type variant|
		type := self parameterTypes at: idx.
		variant := dispparams argsArray at: idx.
		variant init.
		
		type checkElementaryTypeAndWrite: value to: variant 
	]
]

{ #category : #'instance creation' }
COMMethod >> from: aFuncDesc in: aTypeInfo [
	| paramTypes allNames |
	
	self returnType: aFuncDesc elemdescFunc calculateType.
	self typeInfo: aTypeInfo.
	self memberId: aFuncDesc memid.

	self parameterTypes: OrderedCollection new.

	(aFuncDesc cParams > 0) ifTrue:[
		paramTypes := FFIExternalArray fromHandle: aFuncDesc lprgelemdescParam getHandle type: ELEMDESC size: aFuncDesc cParams.
		paramTypes do:[:e | self parameterTypes add: e calculateType ].
	].

	allNames := self typeInfo getNamesOfMemberID: aFuncDesc memid  maxNames: aFuncDesc cParams + 1.
	
	1 to: (self parameterTypes size + 1 - allNames size ) do:[:i | allNames add: 'aParam' , i asString].
	
	self name: allNames first.
	self parameterNames: allNames allButFirst.
		
	self invokeKind: aFuncDesc invkind.
	
	(aFuncDesc cParamsOpt > 0) ifTrue:[
		self optionalParameters: (self parameterNames last: aFuncDesc cParamsOpt).
	] ifFalse: [ 
		self optionalParameters: #().	
	]
]

{ #category : #accessing }
COMMethod >> invokeKind [
	^ invokeKind
]

{ #category : #accessing }
COMMethod >> invokeKind: anObject [
	invokeKind := anObject
]

{ #category : #invoking }
COMMethod >> invokeOn: anObject withArgs: arguments [
	| result returnedValue exceptionInfo argumentError rtnObject params |
	argumentError := ExternalAddress allocate: Smalltalk wordSize.

	argumentError autoRelease.
	argumentError unsignedLongAt: 1 put: 0.

	returnedValue := Win32Variant externalNew.
	returnedValue autoRelease.
	returnedValue init.

	exceptionInfo := COMExcepInfo externalNew.
	exceptionInfo autoRelease.

	params := self buildFunctionArguments: arguments.

	result := anObject
		ffiInvokeMemberId: self memberId
		refiid: GUID nullGuid
		lcid: LOCALE_USER_DEFAULT
		flags: self invokeKind value
		params: params
		resultHolder: returnedValue
		exceptionInfo: exceptionInfo
		argumentError: argumentError.

	self reportErrorIfNoZero: result.

	params clearArguments.

	returnType isVoid 
		ifTrue: [rtnObject := anObject ] 
		ifFalse: [
			rtnObject :=  returnedValue read.
			returnedValue clear
		].

	^ rtnObject
]

{ #category : #testing }
COMMethod >> isFunction [
	^ self invokeKind = COMInvokeKind Function.
]

{ #category : #testing }
COMMethod >> isGet [
	^ (self invokeKind = COMInvokeKind Get)
]

{ #category : #testing }
COMMethod >> isProperty [
	^ self isGet or: [ self isPut ]
]

{ #category : #testing }
COMMethod >> isPut [
	^ (self invokeKind = COMInvokeKind Put)
]

{ #category : #accessing }
COMMethod >> memberId [
	^ memberId
]

{ #category : #accessing }
COMMethod >> memberId: anObject [
	memberId := anObject
]

{ #category : #accessing }
COMMethod >> name [
	^ name
]

{ #category : #accessing }
COMMethod >> name: anObject [
	name := anObject
]

{ #category : #accessing }
COMMethod >> optionalParameters [
	^ optionalParameters
]

{ #category : #accessing }
COMMethod >> optionalParameters: anObject [
	optionalParameters := anObject
]

{ #category : #accessing }
COMMethod >> parameterNames [
	^ parameterNames
]

{ #category : #accessing }
COMMethod >> parameterNames: anObject [
	parameterNames := anObject
]

{ #category : #accessing }
COMMethod >> parameterTypes [
	^ parameterTypes
]

{ #category : #accessing }
COMMethod >> parameterTypes: anObject [
	parameterTypes := anObject
]

{ #category : #printing }
COMMethod >> parametersWithType [
	^ parameterTypes with: parameterNames collect: [ :paramType :paramName | 
		((self optionalParameters includes: paramName) ifTrue:'[OPT] ' ifFalse:'') ,
		paramType typeName , ' ' , paramName ].
]

{ #category : #printing }
COMMethod >> printOn: aStream [
	aStream 
				nextPutAll: 'COMMethod (';
				nextPutAll: self returnType typeName;
				nextPut: Character space;
				nextPutAll: self name;
				nextPut: $(;
				nextPutAll: (self parametersWithType joinUsing: ', ');
				nextPut: $);
				nextPut: Character space;
				nextPutAll: self invokeKind asString;
				nextPut: $).
]

{ #category : #accessing }
COMMethod >> returnType [
	^ returnType
]

{ #category : #accessing }
COMMethod >> returnType: anObject [
	returnType := anObject
]

{ #category : #accessing }
COMMethod >> typeInfo [
	^ typeInfo
]

{ #category : #accessing }
COMMethod >> typeInfo: anObject [
	typeInfo := anObject
]
