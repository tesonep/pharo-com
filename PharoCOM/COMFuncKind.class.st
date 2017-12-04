Class {
	#name : #COMFuncKind,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'FUNC_DISPATCH',
		'FUNC_NONVIRTUAL',
		'FUNC_PUREVIRTUAL',
		'FUNC_STATIC',
		'FUNC_VIRTUAL'
	],
	#category : 'PharoCOM-Enums'
}

{ #category : #'as yet unclassified' }
COMFuncKind class >> enumDecl [
	^ #(
        FUNC_VIRTUAL   0
        FUNC_PUREVIRTUAL	1
        FUNC_NONVIRTUAL	2 
        FUNC_STATIC	3 
        FUNC_DISPATCH 4 
	)
]

{ #category : #'as yet unclassified' }
COMFuncKind class >> initialize [
	self initializeEnumeration
]
