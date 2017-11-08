copying
copy: other
	| guid |
	guid := self externalNew autoRelease; yourself.
	
	1 to: self byteSize do:[:i |
		guid getHandle unsignedByteAt: i put: (other getHandle unsignedByteAt: i)	].
	^ guid.