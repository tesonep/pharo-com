as yet unclassified
ffiMultiByteToWideCharacterCodepage: codepage flags: flags input: input inputLen: inputLen output: output outputLen: outputLen
	^self ffiCall: #(int MultiByteToWideChar(uint codepage, DWORD flags, LPCSTR input, int inputLen, LPWSTR output, int outputLen ))