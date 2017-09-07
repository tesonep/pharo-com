as yet unclassified
printOn: aStream
	aStream
		nextPutAll: 'GUID (';
		nextPutAll: self asString;
		nextPut: $)