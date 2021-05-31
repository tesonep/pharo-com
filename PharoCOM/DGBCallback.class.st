Class {
	#name : #DGBCallback,
	#superclass : #FFICallback,
	#pools : [
		'DBGHelpTypes'
	],
	#category : #'PharoCOM-DBGHelp'
}

{ #category : #'instance creation' }
DGBCallback class >> fnSpec [
	self subclassResponsibility 
]

{ #category : #'instance creation' }
DGBCallback class >> new [
	^ super new
		yourself
]

{ #category : #'instance creation' }
DGBCallback class >> on: aBlock [
	^ self 
		signature: self fnSpec 
		block: aBlock 
]
