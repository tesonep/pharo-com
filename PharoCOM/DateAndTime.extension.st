Extension { #name : #DateAndTime }

{ #category : #'*PharoCOM' }
DateAndTime class >> oleEpoch [
	"Answer a DateAndTime representing the DOS epoch (30 December 1900 at midnight to 31 December)"

	^ self basicNew
		ticks: #(2415021 0 0) offset: Duration zero;
		yourself.
]
