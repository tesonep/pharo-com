accessing
size
	| size pos |
	size := 0.
	pos := 1.

	[ (self handle unsignedByteAt: pos) = 0 and: [ (self handle unsignedByteAt: pos + 1) = 0 ] ]
		whileFalse: [ size := size + 1.
			pos := pos + 2 ].

	^ size