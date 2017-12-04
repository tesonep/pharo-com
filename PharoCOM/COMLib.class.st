Class {
	#name : #COMLib,
	#superclass : #FFILibrary,
	#pools : [
		'COMTypes'
	],
	#category : 'PharoCOM'
}

{ #category : #'as yet unclassified' }
COMLib >> ffiAddRef: var [
	self ffiCall: #(ulong AddRef(void* var))
]

{ #category : #'as yet unclassified' }
COMLib >> ffiCoCreateInstance:pointer of:clsid as: riid. [
	self ffiCall: #(HRESULT CoCreateInstance(GUID* clsid , 0, 16r15, GUID* riid, void* pointer))
]

{ #category : #'as yet unclassified' }
COMLib >> ffiFillCLSID: clsid from:win32WideString [ 
	self ffiCall: #(HRESULT CLSIDFromString(LPWSTR win32WideString, GUID* clsid))
]

{ #category : #'as yet unclassified' }
COMLib >> ffiFillIID: clsid from:win32WideString [ 
	self ffiCall: #(HRESULT IIDFromString(LPWSTR win32WideString, GUID* clsid))
]

{ #category : #'as yet unclassified' }
COMLib >> ffiInitializeCOM: dwCoInit [
	self ffiCall:#(HRESULT CoInitializeEx(0, ulong dwCoInit))
]

{ #category : #'as yet unclassified' }
COMLib >> ffiOleInitialize [
	self ffiCall:#(HRESULT OleInitialize(0))
]

{ #category : #common }
COMLib >> initLibrary [
   | r |
	super initialize.
	r := self ffiOleInitialize.
	
   (r ~= 0 and:[ r ~= 1 ]) ifTrue: [ self error: 'Could not initialize COM: ' , r asString ].
	^ r.
]

{ #category : #'as yet unclassified' }
COMLib >> win32ModuleName [
	"While this is not a 'libc' properly, msvcrt has the functions we are defining here"
	^ 'Ole32.dll'
]
