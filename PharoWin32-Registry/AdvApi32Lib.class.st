"
I am the FFI Module that has all the functions in AdvApi32.dll
Moslty of the functions refers to the Windows Registry.
"
Class {
	#name : #AdvApi32Lib,
	#superclass : #FFILibrary,
	#pools : [
		'WinRegTypes'
	],
	#category : 'PharoWin32-Registry'
}

{ #category : #'ffi-calls-open-close' }
AdvApi32Lib >> ffiRegCloseKey: hKey [
	^ self ffiCall: #(LONG RegCloseKey(HKEY hKey))
]

{ #category : #'ffi-calls-querying' }
AdvApi32Lib >> ffiRegEnumKey: hKey index: dwIndex nameHolder: lpName nameSizeHolder: lpcName reserved: lpReserved classNameHolder: lpClass classLengthHolder: lpcClass lastWriteTime: lpftLastWriteTime [
	^ self
		ffiCall:
			#(LONG RegEnumKeyExW (HKEY hKey , DWORD dwIndex , LPTSTR lpName , LPDWORD lpcName , LPDWORD lpReserved , LPTSTR lpClass , LPDWORD lpcClass , PFILETIME lpftLastWriteTime))
]

{ #category : #'ffi-calls-querying' }
AdvApi32Lib >> ffiRegEnumValueKey: hKey
index: dwIndex
nameHolder: lpValueName
nameSizeHolder: lpcchValueName
reserved: lpReserved "Should be Null"
typeHolder: lpType
dataHolder: lpData
dataLengthHolder: lpcbData [
	^ self
		ffiCall:
			#(LONG RegEnumValueW (HKEY hKey , DWORD dwIndex , LPTSTR lpValueName , LPDWORD lpcchValueName , LPDWORD lpReserved , LPDWORD lpType , LPBYTE lpData , LPDWORD lpcbData))
]

{ #category : #'ffi-calls-open-close' }
AdvApi32Lib >> ffiRegOpenKeyEx: hKey subkey: lpSubKey options: ulOptions samDesired: samDesired result: phkResult [
	^ self
		ffiCall:
			#(LONG RegOpenKeyExW(HKEY hKey , LPCTSTR lpSubKey , DWORD ulOptions , REGSAM samDesired , PHKEY phkResult))
]

{ #category : #'ffi-calls-querying' }
AdvApi32Lib >> ffiRegQueryInfoKey: hKey
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
lastWriteTimeHolder: lpftLastWriteTime [

	^ self
		ffiCall:
			#(LONG RegQueryInfoKeyW (HKEY hKey , LPTSTR lpClass , LPDWORD lpcClass , LPDWORD lpReserved , LPDWORD lpcSubKeys , LPDWORD lpcMaxSubKeyLen , LPDWORD lpcMaxClassLen , LPDWORD lpcValues , LPDWORD lpcMaxValueNameLen , LPDWORD lpcMaxValueLen , LPDWORD lpcbSecurityDescriptor , PFILETIME lpftLastWriteTime))
]

{ #category : #'accessing platform' }
AdvApi32Lib >> win32ModuleName [
	^ 'Advapi32.dll'
]
