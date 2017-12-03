private
ensureOpen
	"First I ensure the parent is open, then I open my self"

	| subKeyUnicode phkey returnCode |
	
	self parent ensureOpen.
	
	self handle isNull ifFalse: [ ^ self ].
	
	subKeyUnicode := Win32WideString fromString: subKey.
	phkey := PHKEY new.
	
	returnCode := AdvApi32Lib uniqueInstance ffiRegOpenKeyEx: parent handle subkey: subKeyUnicode options: 0 samDesired: KEY_READ result: phkey.
	
	(returnCode ~= 0) ifTrue:[ Kernel32Lib uniqueInstance reportError: returnCode].
	
	self handle: phkey value.