accessing
vtable
	handle isNull
		ifTrue: [ ^ nil ].
	^ handle pointerAt: 1