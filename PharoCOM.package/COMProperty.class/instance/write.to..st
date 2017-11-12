accessing
write: aValue to: anObj
	setter ifNil: [ self error: 'The property ' , name , ' does not allow to be written.' ].
	^ setter invokeOn: anObj withArgs: {aValue}