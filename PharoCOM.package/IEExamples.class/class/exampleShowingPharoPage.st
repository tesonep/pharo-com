as yet unclassified
exampleShowingPharoPage
	| obj |
	
	obj := COMDispatchInstance createInstanceOf: '{0002DF01-0000-0000-C000-000000000046}' "InternetExplorer".
	obj propertyNamed: #Visible put: true.