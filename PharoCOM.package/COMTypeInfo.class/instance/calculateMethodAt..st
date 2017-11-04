calculating members
calculateMethodAt: anInteger 
	| pointer funDesc r |
	
	pointer := ExternalAddress allocate: Smalltalk wordSize.
	pointer autoRelease.
	r := self ffiGetFuncDesc: pointer at: (anInteger - 1).
	
	(r ~= 0) ifTrue:[ self reportError: r ].
	
	[	
		funDesc := COMFuncDesc fromHandle: pointer.
		^ COMMethod fromFuncDesc: funDesc in: self.
	] ensure: [ funDesc ifNotNil: [ self ffiReleaseFuncDesc: funDesc ] ]