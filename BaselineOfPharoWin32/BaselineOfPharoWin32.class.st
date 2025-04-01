Class {
	#name : 'BaselineOfPharoWin32',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfPharoWin32',
	#package : 'BaselineOfPharoWin32'
}

{ #category : 'baselines' }
BaselineOfPharoWin32 >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec
		   package: #'VTable-FFI-Extension'; 
			package: #'PharoWin32';
			package: #'PharoWin32-Registry' with: [ spec requires: #('PharoWin32') ];

			package: #'PharoWin32-Tests' with: [ spec requires: #('PharoWin32') ];
			package: #'PharoWin32-Registry-Tests' with: [ spec requires: #('PharoWin32-Registry') ];

			package: #'PharoCOM' with: [ spec requires: #('PharoWin32' 'PharoWin32-Registry' 'VTable-FFI-Extension') ];
			package: #'PharoCOM-Tests' with: [ spec requires: #('PharoCOM') ];
			
			package: #'DBGHelp' with: [ spec requires: #('PharoCOM' ) ].
		
		spec 
			group: 'core' with: #('PharoWin32');
			group: 'dbg' with: #('DBGHelp');
			group: 'registry' with: #('PharoWin32-Registry' 'core');
			group: 'com' with: #('PharoCOM' 'core' 'registry');
			group: 'default' with: #('com' 'dbg' 'tests');
			group: 'core-tests' with: #('core' 'PharoWin32-Tests');
			group: 'tests' with: #('core-tests' 'PharoCOM-Tests' 'PharoWin32-Registry-Tests') ]
]
