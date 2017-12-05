Class {
	#name : #COMTypeLibName,
	#superclass : #Object,
	#traits : 'TWinErrorChecker',
	#classTraits : 'TWinErrorChecker classTrait',
	#instVars : [
		'guid',
		'name',
		'version',
		'languageIDs'
	],
	#pools : [
		'COMTypes'
	],
	#category : #'PharoCOM-TypeLibraries'
}

{ #category : #'as yet unclassified' }
COMTypeLibName class >> readFromRegistry [
	^ COMTypeLibRegistryReader new readAll.
]

{ #category : #accessing }
COMTypeLibName >> guid [
	^ guid
]

{ #category : #accessing }
COMTypeLibName >> guid: anObject [
	guid := anObject
]

{ #category : #accessing }
COMTypeLibName >> languageIDs [
	^ languageIDs
]

{ #category : #accessing }
COMTypeLibName >> languageIDs: anObject [
	languageIDs := anObject
]

{ #category : #loading }
COMTypeLibName >> loadWithRegistryInfo [
	| typeLibHolder returnCode rguid wVerMajor wVerMinor lcid versionArray |
	
	typeLibHolder := POINTER_HOLDER new.
	
	rguid := GUID fromString: self guid.
	
	versionArray := self version splitOn: '.'.
	wVerMajor := versionArray first asInteger.
	wVerMinor := versionArray second asInteger.
	
	lcid := self languageIDs first.
	
	returnCode := OleAut32Lib uniqueInstance
		ffiLoadRegTypeLibGuid: rguid getHandle
		versionMajor: wVerMajor
		versionMinor: wVerMinor
		languageId: lcid
		libraryHolder: typeLibHolder.
		
	self reportErrorIfNoZero: returnCode.
	
	^ (COMTypeLib fromHandle: typeLibHolder value) 
		libName: self; 
		yourself
]

{ #category : #accessing }
COMTypeLibName >> name [
	^ name
]

{ #category : #accessing }
COMTypeLibName >> name: anObject [
	name := anObject
]

{ #category : #printing }
COMTypeLibName >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: (name ifNil: [ guid ]) asString;
		nextPutAll: ' - ';
		nextPutAll: version asString;
		nextPut: $)
]

{ #category : #accessing }
COMTypeLibName >> version [
	^ version
]

{ #category : #accessing }
COMTypeLibName >> version: anObject [
	version := anObject
]
