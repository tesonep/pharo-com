ffi-calls
ffiGetRefTypeInfo: hRefType pointer: pointer
	^ self ffiCall: #(HRESULT GetRefTypeOfImplType(self, DWORD hRefType, void* pointer)) at: 15