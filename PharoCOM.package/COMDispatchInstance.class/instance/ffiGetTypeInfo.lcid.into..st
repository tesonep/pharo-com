ffi-calls
ffiGetTypeInfo: iTInfo lcid: lcid into: holder

	^ self ffiCall: #(HRESULT GetTypeInfo(self, UINT iTInfo, LCID lcid, void** holder)) at: 5.	

