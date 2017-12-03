ffi-calls
ffiRegOpenKeyEx: hKey subkey: lpSubKey options: ulOptions samDesired: samDesired result: phkResult
	^ self ffiCall: #(LONG RegOpenKeyEx(HKEY hKey, LPCTSTR lpSubKey, DWORD ulOptions, REGSAM samDesired, PHKEY phkResult))