Class {
	#name : #COMVarKind,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'VAR_CONST',
		'VAR_DISPATCH',
		'VAR_PERINSTANCE',
		'VAR_STATIC'
	],
	#category : #'PharoCOM-Enums'
}

{ #category : #'as yet unclassified' }
COMVarKind class >> const [
 	^ VAR_CONST 
]

{ #category : #'as yet unclassified' }
COMVarKind class >> dispatch [
 	^ VAR_DISPATCH
]

{ #category : #'as yet unclassified' }
COMVarKind class >> enumDecl [
	^ #(
       VAR_PERINSTANCE 	0
		 VAR_STATIC 	1
	    VAR_CONST 	2
	    VAR_DISPATCH 3
 	)
]

{ #category : #'as yet unclassified' }
COMVarKind class >> initialize [
	self initializeEnumeration
]

{ #category : #'as yet unclassified' }
COMVarKind class >> perInstance [ 
 	^ VAR_PERINSTANCE 
]

{ #category : #'as yet unclassified' }
COMVarKind class >> static [

	^ VAR_STATIC
]
