Class {
	#name : #Win32FFILibrary,
	#superclass : #FFILibrary,
	#traits : 'TWinErrorChecker',
	#classTraits : 'TWinErrorChecker classTrait',
	#pools : [
		'Win32Types'
	],
	#category : #PharoWin32
}

{ #category : #converting }
Win32FFILibrary >> calloutAPIClass [

	^ TFCalloutAPI
]

{ #category : #converting }
Win32FFILibrary >> runner [ 
	
	^ TFWorker default
]
