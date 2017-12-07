Class {
	#name : #COMDispatchInstanceInspector,
	#superclass : #Object,
	#category : #'PharoCOM-UI'
}

{ #category : #structure }
COMDispatchInstanceInspector >> buildPresentationOn: builder for: anInstance [
	builder tabulator with: [ :tab | 
		tab title: 'COM Dispatch'.
		tab row: #general span: 1.
		tab row: #elements span: 3.
			
		tab transmit to: #general;
			andShow: [ :general | self generalSectionOn: general for: anInstance ].

		tab transmit to: #elements;
			andShow: [ :elems | self elementsSectionOn: elems for: anInstance] ]
]

{ #category : #structure }
COMDispatchInstanceInspector >> elementsSectionOn: elems for: anInstance [
	elems tabulator with: [ :a | self propertiesSectionOn: a for: anInstance ].
	elems tabulator with: [ :a | self functionsSectionOn: a for: anInstance ]
]

{ #category : #functions }
COMDispatchInstanceInspector >> functionInfo: aFunction [
	^ {
		'MemberID' -> aFunction memberId asString.
		'Name' -> aFunction name.
		'Return Type' -> aFunction returnType typeName.
		'Parameters' -> (aFunction parametersWithType joinUsing: ', ').
		'Invoke Kind' -> aFunction invokeKind item asString
	}
]

{ #category : #functions }
COMDispatchInstanceInspector >> functionsSectionOn: builder for: anInstance [
	builder title: 'Functions'.
	builder column: #list span: 1.
	builder column: #detail span: 4.
	
	builder transmit
		to: #list;
		andShow: [ :b | 
			b list
				display: [ :x | x getDispatchType functions ];
				format: [ :p | p name ] ].
	
	builder transmit
		from: #list;
		to: #detail;
		andShow: [ :b | 
			b table
				display: [ :x | self functionInfo: x];
				column: 'Attribute' evaluated: #key;
				column: 'Value' evaluated: #value ]
]

{ #category : #'general info' }
COMDispatchInstanceInspector >> generalInfoOf: anInstance [
	^ { 
		'Address' -> anInstance handle printString.
		'Type' -> anInstance getTypeInfo name. 
		'Dispatch Interface' -> anInstance getDispatchType name. 
	} asDictionary 
]

{ #category : #'general info' }
COMDispatchInstanceInspector >> generalSectionOn: builder for: anInstance [
	builder table
		display: [ (self generalInfoOf: anInstance) associations ];
		column: 'Attribute' evaluated: [ :v | v key ];
		column: 'Value' evaluated: [ :v | v value ];
		hideHeader
]

{ #category : #properties }
COMDispatchInstanceInspector >> propertiesSectionOn: builder for: anInstance [
	builder title: 'Properties'.
	builder column: #list span: 1.
	builder column: #detail span: 4.
	builder transmit
		to: #list;
		andShow: [ :b | 
			b list
				display: [ :x | x getDispatchType properties ];
				selectionAct:  [ :e | (e selection getFrom: anInstance) inspect  ] entitled: 'Inspect Value';
				format: [ :p | p name ] ].
	^ builder transmit
		from: #list;
		to: #detail;
		andShow: [ :b | 
			b table
				display: [ :x | self propertyInfo: x];
				column: 'Attribute' evaluated: #key;
				column: 'Value' evaluated: #value
			]
]

{ #category : #properties }
COMDispatchInstanceInspector >> propertyInfo: aProperty [
	^ {
	('Name' -> aProperty name).
	('Type' -> aProperty type typeName).
	('Get' -> (aProperty getter ifNotNil: [ 'Yes' ] ifNil: [ 'No' ])).
	('Set' -> (aProperty setter ifNotNil: [ 'Yes' ] ifNil: [ 'No' ]))
	}
]
