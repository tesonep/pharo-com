as yet unclassified
initialize
   | r |
	super initialize.
	r := self ffiOleInitialize.
	
   (r ~= 0 and:[ r ~= 1 ]) ifTrue: [ self error: 'Could not initialize COM: ' , r asString ].
	^ r.