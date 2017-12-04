Class {
	#name : #COMDispParams,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_ARGS',
		'OFFSET_CARGS',
		'OFFSET_CNAMEDARGS',
		'OFFSET_NAMEDARGS'
	],
	#pools : [
		'COMTypes'
	],
	#category : 'PharoCOM-Types'
}

{ #category : #'as yet unclassified' }
COMDispParams class >> externalEmpty [
	| obj |
		
	obj := self externalNew.
	obj autoRelease.
		
	obj cArgs: 0.
	obj cNamedArgs: 0.
	obj args: FFIExternalObject null.
	obj namedArgs: FFIExternalObject null.
	
	^obj
]

{ #category : #'as yet unclassified' }
COMDispParams class >> externalForSize: argumentsSize namedArgs: namedArgs [
	| obj argsArray namesArray |
		
	obj := self externalNew.
	obj autoRelease.
	
	argumentsSize = 0 ifTrue: [ argsArray := FFIExternalObject null ] ifFalse:[
		argsArray := FFIExternalArray externalNewType: #'Win32Variant' size: argumentsSize.
		argsArray autoRelease].
		
	namedArgs isEmpty ifTrue: [ namesArray := FFIExternalObject null ] ifFalse: [  
		namesArray := FFIExternalArray externalNewType: #'long' size: namedArgs size.
		namesArray autoRelease.
	
		1 to: namedArgs size do:[ :idx | namesArray at:idx put: (namedArgs at:idx)]].	
	
	obj cArgs: argumentsSize.
	obj cNamedArgs: namedArgs size.
	obj args: argsArray.
	obj namedArgs: namesArray.
	
	^obj
]

{ #category : #'as yet unclassified' }
COMDispParams class >> fieldsDesc [
	"
		self rebuildFieldAccessors.
	"
	^ #(
    VARIANT *args;
    DISPID *namedArgs;
    UINT cArgs;
    UINT cNamedArgs;
	)
]

{ #category : #'accessing structure variables' }
COMDispParams >> args [
	"This method was automatically generated"
	^Win32Variant fromHandle: (handle pointerAt: OFFSET_ARGS)
]

{ #category : #'accessing structure variables' }
COMDispParams >> args: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_ARGS put: anObject getHandle.
]

{ #category : #accessing }
COMDispParams >> argsArray [
	^ FFIExternalArray
		fromHandle: (handle pointerAt: OFFSET_ARGS)
		type: #Win32Variant
		size: self cArgs
]

{ #category : #'accessing structure variables' }
COMDispParams >> cArgs [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_CARGS
]

{ #category : #'accessing structure variables' }
COMDispParams >> cArgs: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_CARGS put: anObject
]

{ #category : #'accessing structure variables' }
COMDispParams >> cNamedArgs [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_CNAMEDARGS
]

{ #category : #'accessing structure variables' }
COMDispParams >> cNamedArgs: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_CNAMEDARGS put: anObject
]

{ #category : #'accessing structure variables' }
COMDispParams >> namedArgs [
	"This method was automatically generated"
	^ExternalData 
		fromHandle: (handle platformLongAt: OFFSET_NAMEDARGS)
		type: FFIArchitecture forCurrentArchitecture externalLongType asPointerType
]

{ #category : #'accessing structure variables' }
COMDispParams >> namedArgs: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_NAMEDARGS put: anObject getHandle.
]
