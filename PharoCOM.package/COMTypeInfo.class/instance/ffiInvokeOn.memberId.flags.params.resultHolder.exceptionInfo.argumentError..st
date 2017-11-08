ffi-calls
ffiInvokeOn: instance memberId: memid flags: wFlags params: dispparams resultHolder: resultHolder exceptionInfo: excepInfo argumentError: argumentErrorHolder
	^ self ffiCall: #(HRESULT Invoke ( 
            self,
            COMUnknownInstance instance,
            MEMBERID memid,
            WORD wFlags,
            COMDispParams dispparams,
            Win32Variant resultHolder,
            COMExcepInfo excepInfo,
            void* argumentErrorHolder)) at: 12