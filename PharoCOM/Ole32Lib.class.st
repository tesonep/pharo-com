Class {
	#name : #Ole32Lib,
	#superclass : #FFILibrary,
	#pools : [
		'COMTypes'
	],
	#category : #PharoCOM
}

{ #category : #'ffi-calls' }
Ole32Lib >> ffiCoCreateInstance:pointer of:clsid as: riid. [
	self ffiCall: #(HRESULT CoCreateInstance(GUID* clsid , 0, 16r15, GUID* riid, void* pointer))
]

{ #category : #'ffi-calls' }
Ole32Lib >> ffiFillCLSID: clsid from:win32WideString [ 
	self ffiCall: #(HRESULT CLSIDFromString(LPWSTR win32WideString, GUID* clsid))
]

{ #category : #'ffi-calls' }
Ole32Lib >> ffiFillIID: clsid from:win32WideString [ 
	self ffiCall: #(HRESULT IIDFromString(LPWSTR win32WideString, GUID* clsid))
]

{ #category : #'ffi-calls' }
Ole32Lib >> ffiInitializeCOM: dwCoInit [
	self ffiCall:#(HRESULT CoInitializeEx(0, ulong dwCoInit))
]

{ #category : #'ffi-calls' }
Ole32Lib >> ffiOleInitialize [
	self ffiCall:#(HRESULT OleInitialize(0))
]

{ #category : #common }
Ole32Lib >> initLibrary [
   | r |
	super initialize.
	r := self ffiOleInitialize.
	
   (r ~= 0 and:[ r ~= 1 ]) ifTrue: [ self error: 'Could not initialize COM: ' , r asString ].
	^ r.
]

{ #category : #'accessing platform' }
Ole32Lib >> win32ModuleName [
	^ 'Ole32.dll'
]
