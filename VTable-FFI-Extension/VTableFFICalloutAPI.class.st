Class {
	#name : #VTableFFICalloutAPI,
	#superclass : #TFCalloutAPI,
	#instVars : [
		'tablePosition'
	],
	#category : #'VTable-FFI-Extension'
}

{ #category : #action }
VTableFFICalloutAPI >> newBuilder [
	^ VTableFFICalloutMethodBuilder calloutAPI: self
]

{ #category : #accessing }
VTableFFICalloutAPI >> tablePosition [
	^ tablePosition
]

{ #category : #accessing }
VTableFFICalloutAPI >> tablePosition: anObject [
	tablePosition := anObject
]
