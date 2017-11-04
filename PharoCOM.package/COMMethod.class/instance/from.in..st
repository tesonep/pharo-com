instance creation
from: aFuncDesc in: aTypeInfo
	| paramTypes allNames |
	
	self returnType: aFuncDesc elemdescFunc calculateType.
	self typeInfo: aTypeInfo.
	self memberId: aFuncDesc memid.
	
	paramTypes := FFIExternalArray fromHandle: aFuncDesc lprgelemdescParam getHandle type: ELEMDESC size: aFuncDesc cParams.
	
	self parameterTypes: OrderedCollection new.
	paramTypes do:[:e | self parameterTypes add: e calculateType ].
	
	allNames := self typeInfo getNamesOfMemberID: aFuncDesc memid  maxNames: aFuncDesc cParams + 1.
	
	self name: allNames first.
	self parameterNames: allNames allButFirst.
	
	self assert: (self parameterNames size = self parameterTypes size).
	
	self invokeKind: aFuncDesc invkind.
	
	(aFuncDesc cParamsOpt > 0) ifTrue:[
		self optionalParameters: (self parameterNames last: aFuncDesc cParamsOpt).
	] ifFalse: [ 
		self optionalParameters: #().	
	]
		