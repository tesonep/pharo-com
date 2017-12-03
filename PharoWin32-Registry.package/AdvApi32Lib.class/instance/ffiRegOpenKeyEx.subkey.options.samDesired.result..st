ffi-calls
ffiRegOpenKeyEx: hKey subkey: lpSubKey options: ulOptions samDesired: samDesired result: phkResult
	^ self
		ffiCall:
			#(LONG WINAPI RegQueryInfoKey #(HKEY hKey , LPTSTR lpClass , LPDWORD lpcClass , LPDWORD lpReserved , LPDWORD lpcSubKeys , LPDWORD lpcMaxSubKeyLen , LPDWORD lpcMaxClassLen , LPDWORD lpcValues , LPDWORD lpcMaxValueNameLen , LPDWORD lpcMaxValueLen , LPDWORD lpcbSecurityDescriptor , PFILETIME lpftLastWriteTime))