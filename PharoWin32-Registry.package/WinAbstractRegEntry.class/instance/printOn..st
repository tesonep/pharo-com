printing
printOn: aStream
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: self keyName;
		nextPut: $)