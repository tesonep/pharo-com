as yet unclassified
ffiMessageBoxUnicode:hwnd text:text caption:caption type: type	
	self ffiCall:#(int MessageBoxW(HWND hwnd, LPWSTR text, LPWSTR caption, UINT type)) 