Class {
	#name : #Win32VariantType,
	#superclass : #Object,
	#instVars : [
		'typeName',
		'typeNumber'
	],
	#category : #'PharoCOM-Variant-Types'
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

{ #category : #'as yet unclassified' }
Win32VariantType >> checkIfElementaryTypeAndWrite: aValue to: aVariant [
	"aValue knows its type:"
	aValue asWin32VariantInto: aVariant
	
"  If type is elementary (e. g. string, integer, boolean, i. e. real data), this method can be used 
	as is a hook and can be overriden by subclasses to bypass the decision process in aValue. 
	For instance, this is a direct call to write::

	self write: aValue to: aVariant
"

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
