printing
printOn: aStream
	aStream nextPutAll: 'COMProperty (';
	print: type typeName;
	nextPut: Character space;
	nextPutAll: name;
	nextPutAll: ( getter ifNotNil: [' [GET] '] ifNil: ['']  );
	nextPutAll: ( setter ifNotNil: [' [SET] '] ifNil: ['']  );
	nextPut: $).