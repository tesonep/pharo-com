Class {
	#name : 'Kernel32Lib',
	#superclass : 'FFILibrary',
	#traits : 'TWinErrorChecker',
	#classTraits : 'TWinErrorChecker classTrait',
	#pools : [
		'Win32Types'
	],
	#category : 'PharoWin32',
	#package : 'PharoWin32'
}

{ #category : 'as yet unclassified' }
Kernel32Lib >> ffiCloseHandler: hObject [
	self ffiCall: #(BOOL CloseHandle(HANDLE hObject))
]

{ #category : 'as yet unclassified' }
Kernel32Lib >> ffiFormatMessageFlags: dwFlags source: lpSource messageId: dwMessageId languageId: dwLanguageId string: lpBuffer stringLen: nSize varArgs: arguments [
	^ self ffiCall: #(DWORD FormatMessageW( DWORD dwFlags ,  LPCVOID lpSource ,  DWORD dwMessageId ,  DWORD dwLanguageId ,  LPTSTR lpBuffer ,  DWORD nSize ,  void* arguments))
]

{ #category : 'as yet unclassified' }
Kernel32Lib >> ffiGetEnvironmentVariable: lpName into: lpBuffer size: nSize [

	^ self ffiCall: #(DWORD GetEnvironmentVariableW(LPCTSTR lpName, LPTSTR  lpBuffer, DWORD nSize))
]

{ #category : 'as yet unclassified' }
Kernel32Lib >> ffiGetProcessHeap [
	^ self ffiCall: #(HANDLE GetProcessHeap())
]

{ #category : 'as yet unclassified' }
Kernel32Lib >> ffiHeapFreeHeap: hHeap pointer: lpMem [
	^ self ffiCall: #(BOOL HeapFree (HANDLE hHeap , 0 , LPVOID lpMem))
]

{ #category : 'as yet unclassified' }
Kernel32Lib >> ffiMultiByteToWideCharacterCodepage: codepage flags: flags input: input inputLen: inputLen output: output outputLen: outputLen [
	^self ffiCall: #(int MultiByteToWideChar(uint codepage, DWORD flags, LPCSTR input, int inputLen, LPWSTR output, int outputLen ))
]

{ #category : 'as yet unclassified' }
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

{ #category : 'as yet unclassified' }
Kernel32Lib >> getEnvironmentVariable: aName [
	| name buffer return |

	name := aName asWin32WideString.
	buffer := Win32WideString new: 500.

	return := Kernel32Lib uniqueInstance ffiGetEnvironmentVariable: name into: buffer size: 500.
	
	self reportErrorIfZero: return.

	(return > 500)
		ifTrue: [ self error: 'Not enough buffer space' ].
	
	^ buffer asString
]

{ #category : 'as yet unclassified' }
Kernel32Lib >> lastError [
	^ self ffiCall: #(DWORD GetLastError())
]

{ #category : 'as yet unclassified' }
Kernel32Lib >> localFree: pointer [
	^ self ffiHeapFreeHeap: self ffiGetProcessHeap pointer: pointer.
]

{ #category : 'reporting errors' }
Kernel32Lib >> lookupMessage: codeToLookup [
	| holder string wideString |

"FormatMessage(
        FORMAT_MESSAGE_ALLOCATE_BUFFER | 
        FORMAT_MESSAGE_FROM_SYSTEM |
        FORMAT_MESSAGE_IGNORE_INSERTS,
        NULL,
        dw,
        MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
        (LPTSTR) &lpMsgBuf,
        0, NULL );"

	"Flags: FORMAT_MESSAGE_ALLOCATE_BUFFER | 
        FORMAT_MESSAGE_FROM_SYSTEM |
        FORMAT_MESSAGE_IGNORE_INSERTS"

	holder := POINTER_HOLDER new.

	self ffiFormatMessageFlags: 16r00000100 | 16r00001000 | 16r00000200 source: nil messageId: codeToLookup languageId: 0 string: holder stringLen: 0 varArgs: nil.
	
	holder value isNull ifTrue: [ ^ '' ].
	
	wideString := Win32WideString fromHandle: holder value.
	string := wideString asString.
	
	self localFree: holder value.
	^ string.
]

{ #category : 'reporting errors' }
Kernel32Lib >> reportError: returnCode [
	Win32Error returnCode: returnCode lastErrorCode: self lastError
]

{ #category : 'as yet unclassified' }
Kernel32Lib >> win32LibraryName [ 
	"While this is not a 'libc' properly, msvcrt has the functions we are defining here"
	^ 'Kernel32.dll'
]

{ #category : 'as yet unclassified' }
Kernel32Lib >> win32ModuleName [
	"While this is not a 'libc' properly, msvcrt has the functions we are defining here"
	^ 'Kernel32.dll'
]
