ffi-calls
ffiGetVarDesc: pointer at: index
	^ self ffiCall: #(HRESULT GetFuncDesc(self, UINT index, void** pointer)) at: 7