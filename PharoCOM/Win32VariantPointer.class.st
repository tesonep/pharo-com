Class {
	#name : #Win32VariantPointer,
	#superclass : #Object,
	#instVars : [
		'inner'
	],
	#category : 'PharoCOM-Variant-Types'
}

{ #category : #'instance creation' }
Win32VariantPointer class >> wrap: otherType [
	^ self new
		inner: otherType;
		yourself
]

{ #category : #comparing }
Win32VariantPointer >> = other [
	^ other species = self species and: [ self inner = other inner ]
]

{ #category : #accessing }
Win32VariantPointer >> inner [
	^ inner
]

{ #category : #accessing }
Win32VariantPointer >> inner: anObject [
	inner := anObject
]

{ #category : #testing }
Win32VariantPointer >> isVoid [
	^ false
]

{ #category : #accessing }
Win32VariantPointer >> typeName [
	^ inner typeName , '*'
]
