printing
printOn: aStream
	aStream
		nextPutAll: 'GUID (';
		nextPutAll: self asString;
		nextPut: $)