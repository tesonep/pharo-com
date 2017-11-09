printing
printOn: aStream
	aStream 
				nextPutAll: 'COMMethod (';
				nextPutAll: self returnType typeName;
				nextPut: Character space;
				nextPutAll: self name;
				nextPut: $(;
				nextPutAll: (self parametersWithType joinUsing: ', ');
				nextPut: $);
				nextPut: Character space;
				nextPutAll: self invokeKind asString;
				nextPut: $).