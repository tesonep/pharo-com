converting
asString
	^ String
		streamContents: [ :s | 
			s
				nextPut: ${;
				nextPutAll: (self pad: self data1 to: 8);
				nextPut: $-;
				nextPutAll: (self pad: self data2 to: 4);
				nextPut: $-;
				nextPutAll: (self pad: self data3 to: 4);
				nextPut: $-;
				nextPutAll: (self pad: (self data4 at:1) to: 2);
				nextPutAll: (self pad: (self data4 at:2) to: 2);
				nextPut: $-.
				3 to: 8 do: [ :idx | s nextPutAll: (self pad: (self data4 at:idx) to: 2)].
				s nextPut: $}.
		]