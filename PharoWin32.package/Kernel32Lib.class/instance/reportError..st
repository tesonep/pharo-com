as yet unclassified
reportError: returnCode
	| lastError |
	lastError := self lastError.
	self error: 'Unespected error returnCode: ' , returnCode asString , ': ' , lastError asString