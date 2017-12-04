Class {
	#name : #Kernel32Lib,
	#superclass : #FFILibrary,
	#pools : [
		'Win32Types'
	],
	#category : 'PharoWin32'
}

{ #category : #'as yet unclassified' }
Kernel32Lib >> ffiMultiByteToWideCharacterCodepage: codepage flags: flags input: input inputLen: inputLen output: output outputLen: outputLen [
	^self ffiCall: #(int MultiByteToWideChar(uint codepage, DWORD flags, LPCSTR input, int inputLen, LPWSTR output, int outputLen ))
]

{ #category : #'as yet unclassified' }
Kernel32Lib >> ffiWideCharacterToMultiByteCodepage: codepage flags: flags input: input inputLen: inputLen output: output outputLen: outputLen [
	^self ffiCall: #(int WideCharToMultiByte(uint codepage,
    DWORD flags,
    LPCWCH input,
    int inputLen,
    LPSTR output,
    int outputLen,
    0,
    0
 ))
]

{ #category : #'as yet unclassified' }
Kernel32Lib >> lastError [
	^ self ffiCall: #(DWORD GetLastError())
]

{ #category : #'as yet unclassified' }
Kernel32Lib >> reportError: returnCode [
	| lastError |
	lastError := self lastError.
	self error: 'Unespected error returnCode: ' , returnCode hex asString , ': ' , lastError asString
]

{ #category : #'as yet unclassified' }
Kernel32Lib >> win32ModuleName [
	"While this is not a 'libc' properly, msvcrt has the functions we are defining here"
	^ 'Kernel32.dll'
]
