printing
pad: aNumber to: digits.
	^ (('0' repeat: digits) , (aNumber printStringBase: 16)) last: digits.
	