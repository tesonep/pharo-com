querying
implementedTypesNumber
	^ implementedTypesNumber ifNil:[self fillTypeAttributes. implementedTypesNumber].