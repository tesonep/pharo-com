Extension { #name : #DateAndTime }

{ #category : #'*PharoCOM' }
DateAndTime class >> oleEpoch [
	"Answer a DateAndTime representing the DOS epoch (days since midnight 30 December 1899)"

	^ self basicNew
		ticks: #(2415021 0 0) offset: Duration zero;
		yourself.
]
