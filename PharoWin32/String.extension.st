Extension { #name : #String }

{ #category : #'*PharoWin32' }
String >> asWin32WideString [
	^ Win32WideString fromString: self.
]
