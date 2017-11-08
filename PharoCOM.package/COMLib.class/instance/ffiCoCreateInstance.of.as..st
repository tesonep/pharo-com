as yet unclassified
ffiCoCreateInstance:pointer of:clsid as: riid.
	self ffiCall: #(HRESULT CoCreateInstance(GUID* clsid , 0, 16r15, GUID* riid, void* pointer))