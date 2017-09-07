ffi-calls
ffiQueryInterface: riid into: holder

	^ self ffiCall: #(HRESULT QueryInterface(self, GUID* riid, void** holder)) at: 1