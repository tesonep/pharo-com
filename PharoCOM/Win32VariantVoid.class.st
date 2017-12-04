Class {
	#name : #Win32VariantVoid,
	#superclass : #Object,
	#instVars : [
		'typeNumber'
	],
	#category : 'PharoCOM-Variant-Types'
}

{ #category : #'instance creation' }
Win32VariantVoid class >> newAs: aNumber [
	^ self new
		typeNumber: aNumber;
		yourself
]

{ #category : #comparing }
Win32VariantVoid >> = other [
	^ other species = self species
]

{ #category : #testing }
Win32VariantVoid >> isVoid [
	^ true
]

{ #category : #comparing }
Win32VariantVoid >> typeName [
	^ 'VOID'
]

{ #category : #accessing }
Win32VariantVoid >> typeNumber [
	^ typeNumber
]

{ #category : #accessing }
Win32VariantVoid >> typeNumber: anObject [
	typeNumber := anObject
]
