reference counting
addRef

	^ self ffiCall: #(ULONG AddRef(self)) at: 2