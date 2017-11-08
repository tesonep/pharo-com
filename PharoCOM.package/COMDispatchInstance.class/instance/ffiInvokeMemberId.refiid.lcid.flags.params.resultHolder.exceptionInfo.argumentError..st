ffi-calls
ffiInvokeMemberId: memid refiid: refiid lcid: lcid flags: wFlags params: dispparams resultHolder: resultHolder exceptionInfo: excepInfo argumentError: argumentErrorHolder 
	^ self ffiCall: #(HRESULT Invoke ( 
            self,
            MEMBERID memid,
			   void* refiid,
			   LCID lcid,
            WORD wFlags,
            void* dispparams,
            void* resultHolder,
            void* excepInfo,
            void* argumentErrorHolder)) at: 7