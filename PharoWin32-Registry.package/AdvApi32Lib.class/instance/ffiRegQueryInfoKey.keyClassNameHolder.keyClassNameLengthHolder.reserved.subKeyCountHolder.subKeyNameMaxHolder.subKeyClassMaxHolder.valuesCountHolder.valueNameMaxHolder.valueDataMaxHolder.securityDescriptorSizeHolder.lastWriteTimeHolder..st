ffi-calls
ffiRegQueryInfoKey: hKey
keyClassNameHolder: lpClass
keyClassNameLengthHolder: lpcClass
reserved: lpReserved "Should be Null"
subKeyCountHolder: lpcSubKeys
subKeyNameMaxHolder: lpcMaxSubKeyLen
subKeyClassMaxHolder: lpcMaxClassLen
valuesCountHolder: lpcValues
valueNameMaxHolder: lpcMaxValueNameLen
valueDataMaxHolder: lpcMaxValueLen
securityDescriptorSizeHolder: lpcbSecurityDescriptor
lastWriteTimeHolder: lpftLastWriteTime

	^ self
		ffiCall:
			#(LONG RegQueryInfoKeyW (HKEY hKey , LPTSTR lpClass , LPDWORD lpcClass , LPDWORD lpReserved , LPDWORD lpcSubKeys , LPDWORD lpcMaxSubKeyLen , LPDWORD lpcMaxClassLen , LPDWORD lpcValues , LPDWORD lpcMaxValueNameLen , LPDWORD lpcMaxValueLen , LPDWORD lpcbSecurityDescriptor , PFILETIME lpftLastWriteTime))