as yet unclassified
externalEmpty
	| obj |
		
	obj := self externalNew.
	obj autoRelease.
		
	obj cArgs: 0.
	obj cNamedArgs: 0.
	obj args: FFIExternalObject null.
	obj namedArgs: FFIExternalObject null.
	
	^obj