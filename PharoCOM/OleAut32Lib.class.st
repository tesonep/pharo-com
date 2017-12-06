Class {
	#name : #OleAut32Lib,
	#superclass : #FFILibrary,
	#pools : [
		'COMTypes'
	],
	#category : #PharoCOM
}

{ #category : #'as yet unclassified' }
OleAut32Lib >> ffiLoadRegTypeLibGuid: rguid versionMajor: wVerMajor versionMinor: wVerMinor languageId: lcid libraryHolder: pptlib [
	self
		ffiCall:
			#(HRESULT LoadRegTypeLib(REFGUID rguid , WORD wVerMajor , WORD wVerMinor , LCID lcid , POINTER_HOLDER pptlib))
]

{ #category : #'ffi-calls' }
OleAut32Lib >> ffiSysAllocString: aWin32WideString [
	self ffiCall: #(void* SysAllocString (LPWSTR aWin32WideString))
]

{ #category : #'as yet unclassified' }
OleAut32Lib >> ffiSysFreeString: bstrString [
	self ffiCall: #(void SysFreeString #(BSTR bstrString))
]

{ #category : #'as yet unclassified' }
OleAut32Lib >> ffiVariantClear: aPointer [
	^ self ffiCall: #(HRESULT VariantClear #(void * aPointer))
]

{ #category : #'as yet unclassified' }
OleAut32Lib >> ffiVariantInit: pointer [
	^ self ffiCall: #(HRESULT VariantInit #(void * pointer))
]

{ #category : #'accessing platform' }
OleAut32Lib >> win32ModuleName [ 
	^ 'OleAut32.dll'
]
