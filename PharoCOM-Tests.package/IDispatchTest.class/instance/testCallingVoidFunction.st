tests
testCallingVoidFunction
	| obj |
	
	COMLib uniqueInstance initLibrary.
	obj := COMDispatchInstance createInstanceOf: '{0002DF01-0000-0000-C000-000000000046}' "InternetExplorer".

	obj dispatch: #Quit.