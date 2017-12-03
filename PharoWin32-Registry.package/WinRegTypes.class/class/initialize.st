class initialization
initialize
	"Root Key Constants"
	HKEY_CLASSES_ROOT := WinRegRootEntry fromAddress: 16r80000000.
	HKEY_CURRENT_USER := WinRegRootEntry fromAddress: 16r80000001.
	HKEY_LOCAL_MACHINE := WinRegRootEntry fromAddress: 16r80000002.
	HKEY_USERS := WinRegRootEntry fromAddress: 16r80000003.
	HKEY_PERFORMANCE_DATA := WinRegRootEntry fromAddress: 16r80000004.
	HKEY_PERFORMANCE_TEXT := WinRegRootEntry fromAddress: 16r80000050.
	HKEY_PERFORMANCE_NLSTEXT := WinRegRootEntry fromAddress: 16r80000060