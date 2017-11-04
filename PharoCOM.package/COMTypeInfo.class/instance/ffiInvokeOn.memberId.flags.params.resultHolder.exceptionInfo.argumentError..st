ffi-calls
ffiInvokeOn: instance memberId: memid flags: wFlags params: dispparams resultHolder: result exceptionInfo: excepInfo argumentError: argumentErrorHolder
	^ self ffiCall: #(HRESULT Invoke ( 
            self,
            PVOID instance,
            MEMBERID memid,
            WORD wFlags,
            DISPPARAMS *dispparams,
            VARIANT *resultHolder,
            EXCEPINFO *excepInfo,
            UINT *argumentErrorHolder)) at: 12