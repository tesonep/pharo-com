Extension { #name : #Kernel32Lib }

{ #category : #'*PharoCOM' }
Kernel32Lib >> currentProcessHandle [
	^ self ffiCall: #(HANDLE GetCurrentProcess())
]
