Class {
	#name : #User32Lib,
	#superclass : #FFILibrary,
	#pools : [
		'Win32Types'
	],
	#category : 'PharoWin32'
}

{ #category : #'ffi-calls' }
User32Lib >> ffiMessageBoxUnicode:hwnd text:text caption:caption type: type [	
	self ffiCall:#(int MessageBoxW(HWND hwnd, LPWSTR text, LPWSTR caption, UINT type)) 
]

{ #category : #'ffi-calls' }
User32Lib >> ffiSetFocus: hwnd [	
	self ffiCall:#(HWND SetFocus(HWND hwnd)) 
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
User32Lib >> messageBoxText:text caption:caption type: type [
	^ self messageBox: nil text: text caption: caption type: type 
]

{ #category : #initialization }
User32Lib >> setFocus: aHWND [
	| r |
	r := self ffiSetFocus: aHWND.
	r = 0
		ifTrue: [ Kernel32Lib uniqueInstance reportError: r ]
]

{ #category : #'as yet unclassified' }
User32Lib >> win32ModuleName [
	"While this is not a 'libc' properly, msvcrt has the functions we are defining here"
	^ 'User32.dll'
]
