as yet unclassified
externalFor: arguments namedArgs: namedArgs
	| obj argsArray namesArray |
		
	obj := self externalNew.
	obj autoRelease.
	
	arguments isEmpty ifTrue: [ argsArray := FFIExternalObject null ] ifFalse:[
		argsArray := FFIExternalArray externalNewType: #'Win32Variant' size: arguments size.
		argsArray autoRelease.
	
		1 to: arguments size do:[ :idx | argsArray at:idx put: (arguments at:idx)].
	].
		
	namedArgs isEmpty ifTrue: [ namesArray := FFIExternalObject null ] ifFalse: [  
		namesArray := FFIExternalArray externalNewType: #'long' size: namedArgs size.
		namesArray autoRelease.
	
		1 to: namedArgs size do:[ :idx | namesArray at:idx put: (namedArgs at:idx)].		
	].	
	
	obj cArgs: arguments size.
	obj cNamedArgs: namedArgs size.
	obj args: argsArray.
	obj namedArgs: namesArray.
	
	^obj