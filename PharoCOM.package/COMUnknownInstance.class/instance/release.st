reference counting
release

	^ self ffiCall: #(ULONG Release(self)) at: 3