ffi-calls
ffiGetTypeComp: pointer
	^ self ffiCall: #(HRESULT GetTypeComp(self, void** pointer)) at: 5