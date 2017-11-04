field definition
fieldsDesc
	"
		self rebuildFieldAccessors.
	"

	^ #(
		void* content;
		VARTYPE vt;
	)