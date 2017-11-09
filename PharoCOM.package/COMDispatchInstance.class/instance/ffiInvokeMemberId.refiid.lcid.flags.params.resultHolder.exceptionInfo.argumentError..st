ffi-calls
ffiInvokeMemberId: memid refiid: refiid lcid: lcid flags: wFlags params: dispparams resultHolder: resultHolder exceptionInfo: excepInfo argumentError: argumentErrorHolder 
	^ self ffiCall: #(HRESULT Invoke ( 
            self,
            MEMBERID memid,
			   GUID* refiid,
			   LCID lcid,
            WORD wFlags,
            COMDispParams* dispparams,
            Win32Variant* resultHolder,
            COMExcepInfo* excepInfo,
            void* argumentErrorHolder)) at: 7