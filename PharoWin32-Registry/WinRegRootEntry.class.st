"
I represent the default root entries that exists in the Windows Registry.
"
Class {
	#name : #WinRegRootEntry,
	#superclass : #WinAbstractRegEntry,
	#pools : [
		'WinRegTypes'
	],
	#category : 'PharoWin32-Registry'
}

{ #category : #'instance creation' }
WinRegRootEntry class >> fromAddress: anInteger [
	^ self new
		handle: anInteger pointer;
		yourself
]

{ #category : #private }
WinRegRootEntry >> ensureClose [
	"Nothing to do, this entry is always open."
]

{ #category : #private }
WinRegRootEntry >> ensureOpen [
	"Nothing to do, this entry is always open."
]

{ #category : #accessing }
WinRegRootEntry >> handle [
	^ super handle asExternalPointer
]

{ #category : #accessing }
WinRegRootEntry >> keyName [
	^ WinRegTypes classPool keyAtValue: self
]
