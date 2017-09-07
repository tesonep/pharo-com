*PharoWin32
setLocale: type to: value
	self ffiCall: #(String setlocale(int type, String value))