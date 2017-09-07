as yet unclassified
ffiInitializeCOM: dwCoInit
	self ffiCall:#(HRESULT CoInitializeEx(0, ulong dwCoInit))