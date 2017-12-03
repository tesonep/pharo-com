private
ensureClose
	"First I close my self in the end my parent "

	self handle isNull ifTrue: [ ^ self ].

	AdvApi32Lib uniqueInstance ffiRegCloseKey: self handle.
	
	self handle beNull.
	self parent ensureClose.
