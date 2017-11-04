as yet unclassified
printOn: aStream
	aStream nextPutAll: 'COMProperty (';
	print: type;
	nextPut: Character space;
	nextPutAll: name;
	nextPutAll: ( getter ifNotNil: [' [GET] '] ifNil: ['']  );
	nextPutAll: ( setter ifNotNil: [' [SET] '] ifNil: ['']  );
	nextPut: $).