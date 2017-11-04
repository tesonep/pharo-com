ffi-calls
ffiReleaseTypeAttr: typeattr
	^ self ffiCall: #(void ReleaseTypeAttr(self, TYPEATTR* typeattr)) at: 20