instance creation
new: typeName as: typeNumber
	^ self new
		typeName: typeName;
		typeNumber: typeNumber;
		yourself