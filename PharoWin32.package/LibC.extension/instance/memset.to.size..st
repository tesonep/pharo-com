*PharoWin32
memset: dest to: c size: count
	^ self ffiCall: #(void* memset(void* dest, int c, size_t count ))