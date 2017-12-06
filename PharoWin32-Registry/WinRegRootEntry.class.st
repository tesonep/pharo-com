"
I represent the default root entries that exists in the Windows Registry.
"
Class {
	#name : #WinRegRootEntry,
	#superclass : #WinAbstractRegEntry,
	#instVars : [
		'rootName'
	],
	#pools : [
		'WinRegTypes'
	],
	#category : #'PharoWin32-Registry'
}

{ #category : #'instance creation' }
WinRegRootEntry class >> HKEY_CLASSES_ROOT [
	^ self fromAddress: 16r80000000 rootName: 'HKEY_CLASSES_ROOT'
]

{ #category : #'instance creation' }
WinRegRootEntry class >> HKEY_CURRENT_USER [ 
	^ self fromAddress: 16r80000001 rootName: 'HKEY_CURRENT_USER'
]

{ #category : #'instance creation' }
WinRegRootEntry class >> HKEY_LOCAL_MACHINE [
	^ self fromAddress: 16r80000002 rootName: 'HKEY_LOCAL_MACHINE'
]

{ #category : #'instance creation' }
WinRegRootEntry class >> HKEY_PERFORMANCE_DATA [ 
	^ self fromAddress: 16r80000004 rootName: 'HKEY_PERFORMANCE_DATA'
]

{ #category : #'instance creation' }
WinRegRootEntry class >> HKEY_PERFORMANCE_NLSTEXT [ 
	^ self fromAddress: 16r80000060 rootName: 'HKEY_PERFORMANCE_NLSTEXT'
]

{ #category : #'instance creation' }
WinRegRootEntry class >> HKEY_PERFORMANCE_TEXT [ 
	^ self fromAddress: 16r80000050 rootName: 'HKEY_PERFORMANCE_TEXT'
]

{ #category : #'instance creation' }
WinRegRootEntry class >> HKEY_USERS [
	^ self fromAddress: 16r80000003 rootName: 'HKEY_USERS'
]

{ #category : #'instance creation' }
WinRegRootEntry class >> fromAddress: anInteger [
	^ self new
		handle: anInteger pointer;
		yourself
]

{ #category : #'instance creation' }
WinRegRootEntry class >> fromAddress: anInteger rootName: rootName [
	^ self new
		handle: anInteger pointer;
		rootName: rootName
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
WinRegRootEntry >> fullKeyName [
	^ rootName
]

{ #category : #accessing }
WinRegRootEntry >> handle [
	^ super handle asExternalPointer
]

{ #category : #accessing }
WinRegRootEntry >> keyName [
	^ rootName
]

{ #category : #accessing }
WinRegRootEntry >> rootName: anObject [
	rootName := anObject
]
