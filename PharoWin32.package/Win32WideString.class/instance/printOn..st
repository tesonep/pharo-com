printing
printOn: aStream
	aStream 
		nextPutAll: 'a ' ;
		nextPutAll: self class name;
		nextPut: $(;
		print: self asString;
		nextPut: $)