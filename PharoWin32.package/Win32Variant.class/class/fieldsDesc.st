as yet unclassified
fieldsDesc 
	"
	self rebuildFieldAccessors
	"
	^ #(
		VARTYPE vt;
		WORD  wReserved1;
		WORD  wReserved2;
		WORD  wReserved3;
		Byte8 data;
	)