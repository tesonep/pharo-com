private
typeAttributes
	"It should release the received object using #ffiReleaseTypeAttributes:"
	| pointer returnCode |
	pointer := ExternalAddress allocate: Smalltalk wordSize.
	pointer autoRelease.

	returnCode := self ffiGetTypeAttr: pointer.
	
	(returnCode ~= 0) ifTrue: [ self reportError: returnCode ].
	^ COMTypeAttributes fromHandle: pointer.
