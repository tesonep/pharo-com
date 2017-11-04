ffi-calls
ffiReleaseFuncDesc: funcDesc
	^ self ffiCall: #(void ReleaseFuncDesc(self, FUNCDESC* funcDesc)) at: 21