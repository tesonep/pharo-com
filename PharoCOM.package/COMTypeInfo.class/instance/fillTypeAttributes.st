private
fillTypeAttributes
	| typeAttributes |
	[ 
		typeAttributes := self typeAttributes.
		guid := typeAttributes guid asString.
		typeKind := typeAttributes typekind.
		typeFlags := typeAttributes wTypeFlags.
		implementedTypesNumber := typeAttributes cImplTypes.
	]
		ensure: [ typeAttributes ifNotNil: [ self ffiReleaseTypeAttr: typeAttributes ] ]