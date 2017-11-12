baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec
		   package: #'VTable-FFI-Extension'; 
			package: #'PharoWin32' with: [ spec requires: #('VTable-FFI-Extension') ];
			package: #'PharoWin32-Tests' with: [ spec requires: #('PharoWin32') ];
			package: #'PharoCOM' with: [ spec requires: #('PharoWin32') ];
			package: #'PharoCOM-Tests' with: [ spec requires: #('PharoCOM') ].
		
		spec 
			group: 'default' with: #('core' 'tests');
			group: 'core' with: #('PharoWin32' 'PharoCOM');		
			group: 'tests' with: #('PharoWin32-Tests' 'PharoCOM-Tests') ]