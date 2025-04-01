Extension { #name : 'Win32Platform' }

{ #category : '*PharoWin32' }
Win32Platform >> ffiAlignment [
	"Windows structure alignment is 8. 
	 Check here: https://msdn.microsoft.com/en-us/library/aa290049(v=vs.71).aspx"
	
	"I have changed it to 4 because reading better the article, in 32 bits is 4 for structs"
	
	^ 4
]
