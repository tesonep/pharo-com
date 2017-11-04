as yet unclassified
fieldsDesc
"
		self rebuildFieldAccessors.
"

	^ #(
    WORD wCode;
    WORD wReserved;
    BSTR bstrSource;
    BSTR bstrDescription;
    BSTR bstrHelpFile;
    DWORD dwHelpContext;
    ULONG* pvReserved;
    ULONG* pfnDeferredFillIn;
    SCODE scode;
	)