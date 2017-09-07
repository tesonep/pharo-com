as yet unclassified
ffiWideCharacterToMultiByteCodepage: codepage flags: flags input: input inputLen: inputLen output: output outputLen: outputLen
	^self ffiCall: #(int WideCharToMultiByte(uint codepage,
    DWORD flags,
    LPCWCH input,
    int inputLen,
    LPSTR output,
    int outputLen,
    0,
    0
 ))