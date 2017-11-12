initialization
setFocus: aHWND
	| r |
	r := self ffiSetFocus: aHWND.
	r = 0
		ifTrue: [ Kernel32Lib uniqueInstance reportError: r ]