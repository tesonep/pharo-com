Class {
	#name : #Win32VariantType,
	#superclass : #Object,
	#instVars : [
		'typeName',
		'typeNumber'
	],
	#category : 'PharoCOM-Variant-Types'
}

{ #category : #'instance creation' }
Win32VariantType class >> new: typeName as: typeNumber [
	^ self new
		typeName: typeName;
		typeNumber: typeNumber;
		yourself
]

{ #category : #comparing }
Win32VariantType >> = other [
	^ other species = self species and: [ self typeName = other typeName ]
]

{ #category : #testing }
Win32VariantType >> isVoid [
	^ false
]

{ #category : #accessing }
Win32VariantType >> readFrom: aVariant [
	^ self subclassResponsibility 
]

{ #category : #accessing }
Win32VariantType >> typeName [
	^ typeName
]

{ #category : #accessing }
Win32VariantType >> typeName: anObject [
	typeName := anObject
]

{ #category : #accessing }
Win32VariantType >> typeNumber [
	^ typeNumber
]

{ #category : #accessing }
Win32VariantType >> typeNumber: anObject [
	typeNumber := anObject
]

{ #category : #accessing }
Win32VariantType >> write: aValue to: aVariant [
	^ self subclassResponsibility 
]
