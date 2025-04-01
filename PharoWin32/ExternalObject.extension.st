Extension { #name : 'ExternalObject' }

{ #category : '*PharoWin32' }
ExternalObject class >> null [
	^ self new
		setHandle: ExternalAddress null;
		yourself
]
