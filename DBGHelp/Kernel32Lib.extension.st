Extension { #name : #Kernel32Lib }

{ #category : #'*DBGHelp' }
Kernel32Lib >> currentProcessHandle [
	^ self ffiCall: #(HANDLE GetCurrentProcess())
]
