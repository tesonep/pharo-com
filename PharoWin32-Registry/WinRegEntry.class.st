"
I represent any given entry in the Windows Registry. 
I have a parent and a subkey.
"
Class {
	#name : #WinRegEntry,
	#superclass : #WinAbstractRegEntry,
	#instVars : [
		'parent',
		'subKey',
		'desiredAccessLevel'
	],
	#pools : [
		'WinRegTypes'
	],
	#category : #'PharoWin32-Registry'
}

{ #category : #private }
WinRegEntry >> ensureClose [
	"First I close my self in the end my parent "

	self handle isNull ifTrue: [ ^ self ].

	AdvApi32Lib uniqueInstance ffiRegCloseKey: self handle.
	
	self handle beNull.
	self parent ensureClose.
]

{ #category : #private }
WinRegEntry >> ensureOpen [
	"First I ensure the parent is open, then I open my self"

	| subKeyUnicode phkey returnCode |
	
	self parent ensureOpen.
	
	self handle isNull ifFalse: [ ^ self ].
	
	subKeyUnicode := Win32WideString fromString: subKey.
	phkey := PHKEY new.
	
	returnCode := AdvApi32Lib uniqueInstance ffiRegOpenKeyEx: parent handle subkey: subKeyUnicode options: 0 samDesired: desiredAccessLevel result: phkey.
	
	(returnCode ~= 0) ifTrue:[ Kernel32Lib uniqueInstance reportError: returnCode].
	
	self handle: phkey value.
]

{ #category : #initialization }
WinRegEntry >> initialize [
	handle := ExternalAddress new.
	desiredAccessLevel := KEY_READ.
]

{ #category : #accessing }
WinRegEntry >> keyName [
	^ self parent keyName , '\' , subKey
]

{ #category : #accessing }
WinRegEntry >> parent [
	^ parent
]

{ #category : #accessing }
WinRegEntry >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
WinRegEntry >> subKey [
	^ subKey
]

{ #category : #accessing }
WinRegEntry >> subKey: anObject [
	subKey := anObject
]
