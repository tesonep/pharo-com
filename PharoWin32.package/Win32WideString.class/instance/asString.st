converting
asString
	| out r |

	out := ByteArray new: (self size * 4) + 1.

	r := Kernel32Lib uniqueInstance
		ffiWideCharacterToMultiByteCodepage: 65001
		flags: 0
		input: self
		inputLen: self size + 1
		output: out
		outputLen: out size.

	r = 0
		ifTrue: [ Kernel32Lib uniqueInstance reportError: r ].

	^ (out first: r - 1) utf8Decoded