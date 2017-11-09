as yet unclassified
externalForSize: argumentsSize namedArgs: namedArgs
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