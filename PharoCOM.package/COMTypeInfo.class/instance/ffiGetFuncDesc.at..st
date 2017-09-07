ffi-calls
ffiGetFuncDesc: pointer at: index
	^ self ffiCall: #(HRESULT GetFuncDesc(self, UINT index, void** pointer)) at: 6