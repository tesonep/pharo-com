as yet unclassified
ffiFillCLSID: clsid from:win32WideString 
	self ffiCall: #(HRESULT CLSIDFromString(LPWSTR win32WideString, GUID* clsid))