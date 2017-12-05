Class {
	#name : #COMProperty,
	#superclass : #Object,
	#instVars : [
		'name',
		'type',
		'getter',
		'setter'
	],
	#pools : [
		'COMTypes'
	],
	#category : 'PharoCOM'
}

{ #category : #'instance creation' }
COMProperty class >> named: aString on: aTypeInfo [ 
	^ self new
		named: aString on: aTypeInfo;
		yourself.
]

{ #category : #'calculating members' }
COMProperty >> calculateType [
	setter ifNotNil:[ ^ setter parameterTypes first ].

	getter ifNotNil:[ ^ getter returnType ].
]

{ #category : #accessing }
COMProperty >> getFrom: aObj [ 
	getter ifNil: [ self error: 'The property ' , name , ' does not allow to be read.'  ].
	^ getter invokeOn: aObj withArgs: #().
]

{ #category : #accessing }
COMProperty >> getter [
	^ getter
]

{ #category : #accessing }
COMProperty >> getter: anObject [
	getter := anObject
]

{ #category : #accessing }
COMProperty >> name [
	^ name
]

{ #category : #accessing }
COMProperty >> name: anObject [
	name := anObject
]

{ #category : #'instance initalization' }
COMProperty >> named: aName on: aTypeInfo [ 
	self name: aName.
	getter := aTypeInfo methods detect: [ :e | e isGet and: [ e name = aName ] ] ifNone: nil.
	setter := aTypeInfo methods detect: [ :e | e isPut and: [ e name = aName ] ] ifNone: nil.	
	type := self calculateType.
]

{ #category : #printing }
COMProperty >> printOn: aStream [
	aStream nextPutAll: 'COMProperty (';
	print: type typeName;
	nextPut: Character space;
	nextPutAll: name;
	nextPutAll: ( getter ifNotNil: [' [GET] '] ifNil: ['']  );
	nextPutAll: ( setter ifNotNil: [' [SET] '] ifNil: ['']  );
	nextPut: $).
]

{ #category : #accessing }
COMProperty >> setter [
	^ setter
]

{ #category : #accessing }
COMProperty >> setter: anObject [
	setter := anObject
]

{ #category : #accessing }
COMProperty >> type [
	^ type
]

{ #category : #accessing }
COMProperty >> type: anObject [
	type := anObject
]

{ #category : #accessing }
COMProperty >> write: aValue to: anObj [
	setter ifNil: [ self error: 'The property ' , name , ' does not allow to be written.' ].
	^ setter invokeOn: anObj withArgs: {aValue}
]
