ffi-calls
ffiGetNamesOf: memberId into: pointerToStrings size: maxNames count: resultedCounts 
	^ self ffiCall: #(HRESULT GetNames(self, MEMBERID memberId, void* pointerToStrings, UINT maxNames, UINT* resultedCounts)) at: 8