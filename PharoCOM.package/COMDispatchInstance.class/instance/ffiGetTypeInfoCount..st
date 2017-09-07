ffi-calls
ffiGetTypeInfoCount: holder

	^ self ffiCall: #(HRESULT GetTypeInfoCount(self, UINT* holder)) at: 4