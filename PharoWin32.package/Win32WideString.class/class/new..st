as yet unclassified
new: size
	| obj |
	obj := self new
		handle: (ByteArray new: (size + 1) * 2);
		yourself.
	^obj.