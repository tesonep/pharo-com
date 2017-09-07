as yet unclassified
asString
	^ String
		streamContents: [ :s | 
			s
				nextPut: ${;
				nextPutAll: (self data1 printStringBase: 16);
				nextPut: $-;
				nextPutAll: (self data2 printStringBase: 16);
				nextPut: $-;
				nextPutAll: (self data3 printStringBase: 16);
				nextPut: $-;
				nextPutAll: ((self data4 at:1) printStringBase: 16);
				nextPutAll: ((self data4 at:2) printStringBase: 16);
				nextPut: $-.
				3 to: 8 do: [ :idx | s nextPutAll: ((self data4 at:idx) printStringBase: 16)].
				s nextPut: $}.
		]