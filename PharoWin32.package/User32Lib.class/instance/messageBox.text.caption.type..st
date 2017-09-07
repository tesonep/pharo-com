as yet unclassified
messageBox: hwnd text: text caption: caption type: type
	| textWide captionWide |
	captionWide := caption asWin32WideString.
	textWide := text asWin32WideString.

	^ self
		ffiMessageBoxUnicode: hwnd
		text: textWide
		caption: captionWide
		type: type