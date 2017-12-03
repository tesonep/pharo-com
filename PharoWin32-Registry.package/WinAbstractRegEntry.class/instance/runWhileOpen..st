private
runWhileOpen: aBlock
	self ensureOpen.
	[ aBlock value ]
		ensure: [ self ensureClose ]