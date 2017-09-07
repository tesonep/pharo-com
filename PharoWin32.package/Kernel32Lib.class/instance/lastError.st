as yet unclassified
lastError
	^ self ffiCall: #(DWORD GetLastError())