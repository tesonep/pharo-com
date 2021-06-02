Class {
	#name : #COMTypeInfo,
	#superclass : #COMUnknownInstance,
	#instVars : [
		'methods',
		'properties',
		'guid',
		'typeKind',
		'typeFlags',
		'implementedTypesNumber',
		'name',
		'vars'
	],
	#pools : [
		'COMTypes'
	],
	#category : #'PharoCOM-TypeLibraries'
}

{ #category : #'calculating members' }
COMTypeInfo >> calculateMethodAt: anInteger [
	| pointer funDesc r |
	pointer := ExternalAddress allocate: Smalltalk wordSize.
	pointer autoRelease.
	r := self ffiGetFuncDesc: pointer at: anInteger - 1.
	[ self reportErrorIfNoZero: r ]
		on: Error
		do: [ :e | 
			^ COMErrorOnDiscovery new
				setError: e;
				yourself ].
	[ funDesc := COMFuncDesc fromHandle: pointer.
	^ COMMethod fromFuncDesc: funDesc in: self ]
		ensure: [ funDesc ifNotNil: [ self ffiReleaseFuncDesc: funDesc ] ]
]

{ #category : #'calculating members' }
COMTypeInfo >> calculateMethods [
	| numberOfFunctions typeAttributes all |
	[ typeAttributes := self typeAttributes.
	numberOfFunctions := typeAttributes cFuncs.
	all := OrderedCollection new.

	1 to: numberOfFunctions do: [ :idx | all add: (self calculateMethodAt: idx) ].

	^ all ]
		ensure: [ typeAttributes
				ifNotNil: [ self ffiReleaseTypeAttr: typeAttributes ] ]
]

{ #category : #'calculating members' }
COMTypeInfo >> calculateProperties [
	| propNames |
	
	propNames := ((self methods select: #isProperty) collect: #name) asSet.
	^ propNames collect: [ :e | COMProperty named: e on: self ]
]

{ #category : #'calculating members' }
COMTypeInfo >> calculateVarAt: anInteger [

	| pointer varDesc r |
	pointer := ExternalAddress allocate: Smalltalk wordSize.
	pointer autoRelease.
	r := self ffiGetVarDesc: pointer at: anInteger - 1.
	[ self reportErrorIfNoZero: r ]
		on: Error
		do: [ :e | 
			^ COMErrorOnDiscovery new
				  setError: e;
				  yourself ].
	[ 
	varDesc := COMVarDesc fromHandle: pointer.
	^ COMVar fromFuncDesc: varDesc in: self ] ensure: [ 
		varDesc ifNotNil: [ self ffiReleaseVarDesc: varDesc ] ]
]

{ #category : #'calculating members' }
COMTypeInfo >> calculateVars [

	| numberOfVars typeAttributes all |
	[ 
	typeAttributes := self typeAttributes.
	numberOfVars := typeAttributes cVars.
	all := OrderedCollection new.

	1 to: numberOfVars do: [ :idx | all add: (self calculateVarAt: idx) ].

	^ all ] ensure: [ 
		typeAttributes ifNotNil: [ self ffiReleaseTypeAttr: typeAttributes ] ]
]

{ #category : #querying }
COMTypeInfo >> dispatchInterface [
	self typeKind = COMTypeKind dispatch ifTrue:[ ^ self ].
	^ self getImplementedTypeIndex: -1.
]

{ #category : #'ffi-calls' }
COMTypeInfo >> ffiAddressOfMember: memid invKind: invKind holder: ptr [
	^ self ffiCall: #(HRESULT AddressOfMember(self, MEMBERID memid, INVOKEKIND invKind, void** ptr)) at: 16
]

{ #category : #'ffi-calls' }
COMTypeInfo >> ffiGetDocumentation: memid name: pBstrName docs: pBstrDocString helpContext: pdwHelpContext helpFile: pBstrHelpFile [
	^ self ffiCall: #(HRESULT GetDocumentation #(self , MEMBERID memid , LPBSTR pBstrName , LPBSTR pBstrDocString , LPDWORD pdwHelpContext , LPBSTR pBstrHelpFile)) at: 13
]

{ #category : #'ffi-calls' }
COMTypeInfo >> ffiGetFuncDesc: pointer at: index [
	^ self ffiCall: #(HRESULT GetFuncDesc(self, UINT index, void** pointer)) at: 6
]

{ #category : #'ffi-calls' }
COMTypeInfo >> ffiGetNamesOf: memberId into: pointerToStrings size: maxNames count: resultedCounts [ 
	^ self ffiCall: #(HRESULT GetNames(self, MEMBERID memberId, void* pointerToStrings, UINT maxNames, UINT* resultedCounts)) at: 8
]

{ #category : #'ffi-calls' }
COMTypeInfo >> ffiGetRefTypeInfo: hRefType pointer: pointer [
	^ self ffiCall: #(HRESULT GetRefTypeOfImplType(self, DWORD hRefType, void* pointer)) at: 15
]

{ #category : #'ffi-calls' }
COMTypeInfo >> ffiGetRefTypeOfImplTypeIndex: index pointer: pointer [
	^ self ffiCall: #(HRESULT GetRefTypeOfImplType(self, UINT index, void* pointer)) at: 9
]

{ #category : #'ffi-calls' }
COMTypeInfo >> ffiGetTypeAttr: pointer [
	^ self ffiCall: #(HRESULT GetTypeAttr(self, void** pointer)) at: 4
]

{ #category : #'ffi-calls' }
COMTypeInfo >> ffiGetTypeComp: pointer [
	^ self ffiCall: #(HRESULT GetTypeComp(self, void** pointer)) at: 5
]

{ #category : #'ffi-calls' }
COMTypeInfo >> ffiGetVarDesc: pointer at: index [
	^ self ffiCall: #(HRESULT GetFuncDesc(self, UINT index, void** pointer)) at: 7
]

{ #category : #'ffi-calls' }
COMTypeInfo >> ffiInvokeOn: instance memberId: memid flags: wFlags params: dispparams resultHolder: resultHolder exceptionInfo: excepInfo argumentError: argumentErrorHolder [
	^ self ffiCall: #(HRESULT Invoke ( 
            self,
            COMUnknownInstance instance,
            MEMBERID memid,
            WORD wFlags,
            COMDispParams dispparams,
            Win32Variant resultHolder,
            COMExcepInfo excepInfo,
            void* argumentErrorHolder)) at: 12
]

{ #category : #'ffi-calls' }
COMTypeInfo >> ffiReleaseFuncDesc: funcDesc [
	^ self ffiCall: #(void ReleaseFuncDesc(self, FUNCDESC* funcDesc)) at: 21
]

{ #category : #'ffi-calls' }
COMTypeInfo >> ffiReleaseTypeAttr: typeattr [
	^ self ffiCall: #(void ReleaseTypeAttr(self, TYPEATTR* typeattr)) at: 20
]

{ #category : #'ffi-calls' }
COMTypeInfo >> ffiReleaseVarDesc: varDesc [

	^ self ffiCall: #(void ReleaseVarDesc(self, VARDESC* varDesc)) at: 22
]

{ #category : #private }
COMTypeInfo >> fillAll [
	self
		fillName;
		fillTypeAttributes;
		calculateMethods;
		calculateProperties
]

{ #category : #private }
COMTypeInfo >> fillName [
	| nameHolder returnCode bstrName |
	nameHolder := POINTER_HOLDER new.
	
	returnCode := self
		ffiGetDocumentation: -1
		name: nameHolder
		docs: FFIExternalObject null
		helpContext: FFIExternalObject null
		helpFile: FFIExternalObject null.
		
	self reportErrorIfNoZero: returnCode.
	
	bstrName := BSTRString fromHandle: nameHolder value.
	name := bstrName asString.
	bstrName finalize.
	
]

{ #category : #private }
COMTypeInfo >> fillTypeAttributes [
	| typeAttributes |
	[ 
		typeAttributes := self typeAttributes.
		guid := typeAttributes guid asString.
		typeKind := typeAttributes typekind.
		typeFlags := typeAttributes wTypeFlags.
		implementedTypesNumber := typeAttributes cImplTypes.
	]
		ensure: [ typeAttributes ifNotNil: [ self ffiReleaseTypeAttr: typeAttributes ] ]
]

{ #category : #querying }
COMTypeInfo >> functions [
	^ self methods select:#isFunction.
]

{ #category : #private }
COMTypeInfo >> getImplementedTypeIndex: index [
	| pointer ret href |
	pointer := ExternalAddress allocate: (Smalltalk wordSize).
	pointer autoRelease.

	ret := self ffiGetRefTypeOfImplTypeIndex: index pointer: pointer.
	self reportErrorIfNoZero: ret.
	
	href := pointer signedLongAt: 1.
	ret := self ffiGetRefTypeInfo: href pointer: pointer.
	self reportErrorIfNoZero: ret.

	^ self class fromHandle: (pointer pointerAt:1).
]

{ #category : #'ffi-calls' }
COMTypeInfo >> getNamesOfMemberID: memberId maxNames: maxNames [
	| arrayStrings holder return cant wideStrings |
	
	arrayStrings := ExternalAddress allocate:maxNames * Smalltalk wordSize.
	arrayStrings autoRelease.

	holder := ExternalAddress allocate: Smalltalk wordSize.	
	holder autoRelease.

	return := self ffiGetNamesOf: memberId into: arrayStrings size: maxNames count: holder.
	self reportErrorIfNoZero: return.
	
	cant := holder unsignedLongAt: 1.
	wideStrings := OrderedCollection new.
	0 to:(cant - 1) do:[:idx | wideStrings add: (BSTRString fromHandle: (arrayStrings pointerAt: (1 + (Smalltalk wordSize * idx))))].
	
	wideStrings do: #autoRelease.
	
	^ wideStrings collect: #asString
]

{ #category : #querying }
COMTypeInfo >> guid [
	^ guid ifNil:[ self fillTypeAttributes. guid ]
]

{ #category : #querying }
COMTypeInfo >> implementedTypes [
	(self typeKind = COMTypeKind interface or: [ self typeKind = COMTypeKind coClass ])
		ifFalse: [ self error: 'It only applies to TKIND_INTERFACE or TKIND_COCLASS' ].

	^ (0 to: self implementedTypesNumber - 1)
		collect: [ :i | self getImplementedTypeIndex: i ]
]

{ #category : #querying }
COMTypeInfo >> implementedTypesNumber [
	^ implementedTypesNumber ifNil:[self fillTypeAttributes. implementedTypesNumber].
]

{ #category : #querying }
COMTypeInfo >> methods [
	^ methods ifNil: [ methods := self calculateMethods ]
]

{ #category : #accessing }
COMTypeInfo >> name [
	^ name	ifNil:[ self fillName. name ]
]

{ #category : #printing }
COMTypeInfo >> printOn: aStream [
	aStream nextPutAll: self class name;
	nextPut: $(;
	nextPutAll: (name ifNil:[handle]) asString;
	nextPutAll: (typeKind ifNil:[''] ifNotNil:[' ' , typeKind item asString]);
	nextPut: $)
]

{ #category : #querying }
COMTypeInfo >> properties [
	^ properties ifNil: [ properties := self calculateProperties ]
]

{ #category : #private }
COMTypeInfo >> typeAttributes [
	"It should release the received object using #ffiReleaseTypeAttributes:"
	| pointer returnCode |
	pointer := ExternalAddress allocate: Smalltalk wordSize.
	pointer autoRelease.

	returnCode := self ffiGetTypeAttr: pointer.
	
	self reportErrorIfNoZero: returnCode.
	
	^ COMTypeAttributes fromHandle: pointer.
]

{ #category : #querying }
COMTypeInfo >> typeFlags [
	^ typeFlags ifNil:[ self fillTypeAttributes. typeFlags ]
]

{ #category : #querying }
COMTypeInfo >> typeKind [
	^ typeKind ifNil:[ self fillTypeAttributes. typeKind].
]

{ #category : #'calculating members' }
COMTypeInfo >> vars [

	^ vars ifNil: [ vars := self calculateVars ]
]
