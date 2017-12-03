accessing
values
	^ values  ifNil: [ self fillValues. values ]