Class {
	#name : 'User32Lib',
	#superclass : 'FFILibrary',
	#traits : 'TWinErrorChecker',
	#classTraits : 'TWinErrorChecker classTrait',
	#pools : [
		'Win32Types'
	],
	#category : 'PharoWin32',
	#package : 'PharoWin32'
}

{ #category : 'ffi-calls' }
User32Lib >> ffiMessageBoxUnicode:hwnd text:text caption:caption type: type [	
	self ffiCall:#(int MessageBoxW(HWND hwnd, LPWSTR text, LPWSTR caption, UINT type))
]

{ #category : 'ffi-calls' }
User32Lib >> ffiSetFocus: hwnd [	
	self ffiCall:#(HWND SetFocus(HWND hwnd))
]

{ #category : 'as yet unclassified' }
User32Lib >> messageBox: hwnd text: text caption: caption type: type [
	| textWide captionWide |
	captionWide := caption asWin32WideString.
	textWide := text asWin32WideString.

	^ self
		ffiMessageBoxUnicode: hwnd
		text: textWide
		caption: captionWide
		type: type
]

{ #category : 'as yet unclassified' }
User32Lib >> messageBoxText:text caption:caption type: type [
	^ self messageBox: nil text: text caption: caption type: type
]

{ #category : 'initialization' }
User32Lib >> setFocus: aHWND [
	| result |
	result := self ffiSetFocus: aHWND.

	self reportErrorIfZero: result.
]

{ #category : 'as yet unclassified' }
User32Lib >> win32LibraryName [ 

	"While this is not a 'libc' properly, msvcrt has the functions we are defining here"
	^ 'User32.dll'
]

{ #category : 'as yet unclassified' }
User32Lib >> win32ModuleName [
	"While this is not a 'libc' properly, msvcrt has the functions we are defining here"
	^ 'User32.dll'
]
