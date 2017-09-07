as yet unclassified
refiidFromString: aString
	| guid |
	guid := self externalNew autoRelease; yourself.
	
	COMLib uniqueInstance ffiFillIID: guid from:  aString asWin32WideString.
	^ guid.