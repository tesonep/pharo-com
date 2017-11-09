instance creation
fromString: aString
	| guid |
	guid := self externalNew autoRelease; yourself.
	
	COMLib uniqueInstance ffiFillCLSID: guid from: aString asWin32WideString.
	^ guid.