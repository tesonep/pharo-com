ffi-calls
ffiAddressOfMember: memid invKind: invKind holder: ptr
	^ self ffiCall: #(HRESULT AddressOfMember(self, MEMBERID memid, INVOKEKIND invKind, void** ptr)) at: 16