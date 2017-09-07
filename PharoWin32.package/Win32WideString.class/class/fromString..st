instance creation
fromString: aString
	| r wideString anUTF8String |
	wideString := self new: aString size.
	anUTF8String := aString utf8Encoded asString.

	r := Kernel32Lib uniqueInstance
		ffiMultiByteToWideCharacterCodepage: 65001
		flags: 0
		input: anUTF8String
		inputLen: anUTF8String size + 1
		output: wideString
		outputLen: wideString byteSize.

	r = 0
		ifTrue: [ Kernel32Lib uniqueInstance reportError: r ].
	^ wideString