ffi-calls
modifyFFICall: ffiCall withTablePosition: tablePosition
	ffiCall setHandle: (self vtable pointerAt: ((tablePosition - 1) * Smalltalk wordSize) + 1).
	^ ffiCall.