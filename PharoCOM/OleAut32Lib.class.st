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

{ #category : #'as yet unclassified' }
OleAut32Lib >> ffiSysFreeString: bstrString [
	self ffiCall: #(void SysFreeString #(BSTR bstrString))
]

{ #category : #'accessing platform' }
OleAut32Lib >> win32ModuleName [ 
	^ 'OleAut32.dll'
]
