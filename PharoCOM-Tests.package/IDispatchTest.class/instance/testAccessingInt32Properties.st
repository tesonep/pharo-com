tests
testAccessingInt32Properties
	| obj value |
	COMLib uniqueInstance initLibrary.

	obj := COMDispatchInstance createInstanceOf: '{0002DF01-0000-0000-C000-000000000046}' "InternetExplorer".
	
	obj propertyNamed: #Left put: 250.	
	value := obj propertyNamed: #Left.
	
	self assert: 250 equals: value.
	
	obj dispatch: #Quit.