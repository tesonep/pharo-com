ffi-calls
ffiSetFocus: hwnd	
	self ffiCall:#(HWND SetFocus(HWND hwnd)) 