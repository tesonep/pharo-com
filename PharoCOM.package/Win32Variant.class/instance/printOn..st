printing
printOn: aStream
	aStream nextPutAll: self class name; nextPutAll: ' ( '.
	aStream nextPutAll: self contentType typeName ; nextPutAll: '  '.
	aStream nextPutAll: self read asString; nextPutAll: ' )'.