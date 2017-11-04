as yet unclassified
externalEmpty
	| obj |
	
	self halt.
	
	obj := self externalNew.
	obj autoRelease.
		
	obj cArgs: 0.
	obj cNamedArgs: 0.
	obj handle pointerAt: 1 put: ExternalAddress null.
	obj handle pointerAt: 5 put: ExternalAddress null.
	
	^obj