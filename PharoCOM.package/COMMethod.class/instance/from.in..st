instance creation
from: aFuncDesc in: aTypeInfo
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
		