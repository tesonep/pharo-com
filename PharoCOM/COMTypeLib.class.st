Class {
	#name : #COMTypeLib,
	#superclass : #COMUnknownInstance,
	#instVars : [
		'libName',
		'typeInfos'
	],
	#category : #'PharoCOM-TypeLibraries'
}

{ #category : #'ffi-calls' }
COMTypeLib >> ffiGetTypeInfoCount [
	^ self ffiCall: #(UINT GetTypeInfoCount(self)) at: 4

]

{ #category : #'ffi-calls' }
COMTypeLib >> ffiGetTypeInfoIndex: index into: ppTInfo [
	^ self ffiCall: #(HRESULT GetTypeInfo(self, UINT index, POINTER_HOLDER ppTInfo)) at: 5

]

{ #category : #private }
COMTypeLib >> fillTypeInfos [
	| count holder returnCode | 
	count := self ffiGetTypeInfoCount.
	typeInfos := OrderedCollection new: count.
	
	holder := POINTER_HOLDER new.
	
	0 to: (count - 1) do:[ :index |
		returnCode := self ffiGetTypeInfoIndex: index into: holder.
		self reportErrorIfNoZero: returnCode.
		
		typeInfos add: (COMTypeInfo fromHandle: holder value) fillAll; yourself.
	].
]

{ #category : #accessing }
COMTypeLib >> libName [
	^ libName
]

{ #category : #accessing }
COMTypeLib >> libName: anObject [
	libName := anObject
]

{ #category : #accessing }
COMTypeLib >> typeInfos [
	^ typeInfos
		ifNil: [ self fillTypeInfos.
			typeInfos ]
]

{ #category : #accessing }
COMTypeLib >> win32Path [ 
	^ libName win32Path
]

{ #category : #accessing }
COMTypeLib >> win64Path [ 
	^ libName win64Path
]
