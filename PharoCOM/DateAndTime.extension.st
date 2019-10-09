Extension { #name : #DateAndTime }

{ #category : #'*PharoCOM' }
DateAndTime >> asWin32VariantInto: aVariant [
	| type | 
	type := Win32Variant typeFor: 7. "<-- can this be done with #DATE and TypeMapping?"
	type write: self to: aVariant
]

{ #category : #'*PharoCOM' }
DateAndTime class >> oleEpoch [
	"Answer a DateAndTime representing the DOS epoch (days since midnight 30 December 1899)"

	^ self basicNew
		ticks: #(2415021 0 0) offset: Duration zero;
		yourself.
]
