tests
testAccessingBoolProperties
	| obj dispatchType get_visible put_visible get_resizable v variantTrue variantFalse |
	COMLib uniqueInstance initLibrary.

	obj := COMDispatchInstance createInstanceOf: '{0002DF01-0000-0000-C000-000000000046}' "InternetExplorer".

	dispatchType := obj getDispatchType.

	get_visible := dispatchType methods at:41.
	put_visible := dispatchType methods at:42.

	get_resizable := dispatchType methods at:70.

	v := get_resizable invokeOn: obj withArgs: #(). 
	v := get_visible invokeOn: obj withArgs: #().

	variantTrue := Win32Variant externalNew.
	variantTrue vt: 11.
	variantTrue getHandle unsignedByteAt: 9 put: 16rFF.
	variantTrue getHandle unsignedByteAt: 10 put: 16rFF.
	variantTrue autoRelease.

	variantFalse := Win32Variant externalNew.
	variantFalse vt: 11.
	variantFalse getHandle unsignedByteAt: 9 put: 0.
	variantFalse getHandle unsignedByteAt: 10 put: 0.
	variantFalse autoRelease.

	v:= put_visible invokeOn: obj withArgs: {variantTrue}.

	v:= put_visible invokeOn: obj withArgs: {variantFalse}.
