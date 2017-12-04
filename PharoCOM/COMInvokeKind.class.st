Class {
	#name : #COMInvokeKind,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'INVOKE_FUNC',
		'INVOKE_PROPERTYGET',
		'INVOKE_PROPERTYPUT',
		'INVOKE_PROPERTYPUTREF'
	],
	#category : 'PharoCOM-Enums'
}

{ #category : #'as yet unclassified' }
COMInvokeKind class >> Function [
	^ INVOKE_FUNC
]

{ #category : #'as yet unclassified' }
COMInvokeKind class >> Get [
	^ INVOKE_PROPERTYGET 
]

{ #category : #'as yet unclassified' }
COMInvokeKind class >> Put [
	^ INVOKE_PROPERTYPUT 
]

{ #category : #'as yet unclassified' }
COMInvokeKind class >> enumDecl [
	^ #(
        INVOKE_FUNC	1
        INVOKE_PROPERTYGET	2
        INVOKE_PROPERTYPUT	4
        INVOKE_PROPERTYPUTREF	8
	)
]

{ #category : #'as yet unclassified' }
COMInvokeKind class >> initialize [
	self initializeEnumeration
]

{ #category : #'as yet unclassified' }
COMInvokeKind >> printOn: stream [
	stream nextPutAll: self item printString.
]
