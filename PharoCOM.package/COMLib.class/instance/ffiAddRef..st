as yet unclassified
ffiAddRef: var
	self ffiCall: #(ulong AddRef(void* var))