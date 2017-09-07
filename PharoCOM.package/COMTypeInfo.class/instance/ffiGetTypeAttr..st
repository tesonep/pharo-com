ffi-calls
ffiGetTypeAttr: pointer
	^ self ffiCall: #(HRESULT GetTypeAttr(self, void** pointer)) at: 4