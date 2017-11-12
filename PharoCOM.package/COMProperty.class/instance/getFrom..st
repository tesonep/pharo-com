accessing
getFrom: aObj 
	getter ifNil: [ self error: 'The property ' , name , ' does not allow to be read.'  ].
	^ getter invokeOn: aObj withArgs: #().