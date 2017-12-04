Extension { #name : #LibC }

{ #category : #'*PharoWin32' }
LibC >> memset: dest to: c size: count [
	^ self ffiCall: #(void* memset(void* dest, int c, size_t count ))
]

{ #category : #'*PharoWin32' }
LibC >> setLocale: type to: value [
	self ffiCall: #(String setlocale(int type, String value))
]
