"
This very very simple browser shows how to navigate and use the registry keys and values.
"
Class {
	#name : #WinRegistryBrowser,
	#superclass : #Object,
	#instVars : [
		'browser'
	],
	#category : #'PharoWin32-Registry'
}

{ #category : #'instance creation' }
WinRegistryBrowser class >> open [
	<script>

	self new open.
]

{ #category : #building }
WinRegistryBrowser >> buildBrowser [

	"self new open"

	browser := GLMTabulator new.
	browser column: #keys span: 1.
	browser column: #values span: 3.

	browser transmit
		to: #keys;
		andShow: [ :a | 
			a fastTree
				format: [ :e | e keyName ];
				children: [ :e | [e subKeys] on:Error do:[ #() ] ];
				selectionAct: [:e | e selection inspect ] entitled: 'Inspect' ].

	browser transmit
		from: #keys;
		to: #values;
		andShow: [ :a | 
			a fastTable
				display: [ :e | e values ];
				selectionAct: [:e | e selection inspect ] entitled: 'Inspect';				
				column: 'Name' evaluated: [ :v | v name ifEmpty: [ '(Default)' ] ];
				column: 'Type' evaluated: #typeName;
				column: 'Value' evaluated: [ :v | v data printString ]].
	browser title: 'Registry Browser'
]

{ #category : #building }
WinRegistryBrowser >> open [
	| roots |

	self buildBrowser.

	roots := {WinRegRootEntry HKEY_CLASSES_ROOT.
			WinRegRootEntry HKEY_CURRENT_USER.
			WinRegRootEntry HKEY_LOCAL_MACHINE.
			WinRegRootEntry HKEY_USERS}.

	browser openOn: roots.
			
	
]
