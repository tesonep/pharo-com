accessing
write: aValue to: aVariant
	aValue
		ifTrue: [ 
			aVariant data at: 1 put: 16rFF.
			aVariant data at: 2 put: 16rFF ]
		ifFalse: [ 
			aVariant data at: 1 put: 0.
			aVariant data at: 2 put: 0 ]