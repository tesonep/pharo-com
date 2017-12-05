Class {
	#name : #COMTypeKind,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'TKIND_ALIAS',
		'TKIND_COCLASS',
		'TKIND_DISPATCH',
		'TKIND_ENUM',
		'TKIND_INTERFACE',
		'TKIND_MAX',
		'TKIND_MODULE',
		'TKIND_RECORD',
		'TKIND_UNION'
	],
	#category : 'PharoCOM-Enums'
}

{ #category : #'as yet unclassified' }
COMTypeKind class >> coClass [ 
	^ TKIND_COCLASS
]

{ #category : #'as yet unclassified' }
COMTypeKind class >> dispatch [ 
	^ TKIND_DISPATCH
]

{ #category : #'as yet unclassified' }
COMTypeKind class >> enumDecl [
	^ #(
        TKIND_ENUM			0
        TKIND_RECORD		1
        TKIND_MODULE		2
        TKIND_INTERFACE	3
        TKIND_DISPATCH	4
        TKIND_COCLASS		5
        TKIND_ALIAS		6
        TKIND_UNION		7
        TKIND_MAX			8 
	)
]

{ #category : #'as yet unclassified' }
COMTypeKind class >> initialize [
	self initializeEnumeration
]

{ #category : #'as yet unclassified' }
COMTypeKind class >> interface [ 
	^ TKIND_INTERFACE
]
