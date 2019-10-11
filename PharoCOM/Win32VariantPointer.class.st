Class {
	#name : #Win32VariantPointer,
	#superclass : #Object,
	#instVars : [
		'inner'
	],
	#category : #'PharoCOM-Variant-Types'
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
Win32VariantPointer >> checkIfElementaryTypeAndWrite: aValue to: aVariant [ 
	| innerVariant |
	innerVariant := Win32Variant externalNew.
	innerVariant autoRelease.
	innerVariant init.
	aValue asWin32VariantInto: innerVariant.
	
	self write: innerVariant to: aVariant.

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

{ #category : #writing }
Win32VariantPointer >> write: anInnerVariant to: aVariant [
	| type |

	type := Win32Variant typeFor: 12.
	aVariant vt: type typeNumber + 16r4000. "VT_BYREF"
	aVariant rawData pointerAt: 1 put: anInnerVariant getHandleAsExternalAddress  .
]
