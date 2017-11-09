field definition
fieldsDesc 
	"
	self rebuildFieldAccessors
	"
	^ #(
		DWORD data1;
		WORD  data2;
		WORD  data3;
		Byte8  data4;
	)