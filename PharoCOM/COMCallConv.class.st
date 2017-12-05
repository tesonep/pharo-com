Class {
	#name : #COMCallConv,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'CC_CDECL',
		'CC_FASTCALL',
		'CC_FPFASTCALL',
		'CC_MACPASCAL',
		'CC_MAX',
		'CC_MPWCDECL',
		'CC_MPWPASCAL',
		'CC_MSCPASCAL',
		'CC_STDCALL',
		'CC_SYSCALL'
	],
	#category : 'PharoCOM-Enums'
}

{ #category : #'as yet unclassified' }
COMCallConv class >> enumDecl [
	^ #(
        CC_FASTCALL 		0
        CC_CDECL 			1
        CC_MSCPASCAL		2
        CC_MACPASCAL		3
        CC_STDCALL			4
        CC_FPFASTCALL		5
        CC_SYSCALL			6
        CC_MPWCDECL 		7
        CC_MPWPASCAL 		8
        CC_MAX				9 
	)
]

{ #category : #'as yet unclassified' }
COMCallConv class >> initialize [
	self initializeEnumeration
]
