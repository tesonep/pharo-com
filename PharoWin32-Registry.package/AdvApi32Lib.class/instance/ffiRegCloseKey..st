ffi-calls
ffiRegCloseKey: hKey
	^ self ffiCall: #(LONG RegCloseKey(HKEY hKey))