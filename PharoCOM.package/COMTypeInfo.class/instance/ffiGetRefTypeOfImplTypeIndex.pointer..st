ffi-calls
ffiGetRefTypeOfImplTypeIndex: index pointer: pointer
	^ self ffiCall: #(HRESULT GetRefTypeOfImplType(self, UINT index, void* pointer)) at: 9