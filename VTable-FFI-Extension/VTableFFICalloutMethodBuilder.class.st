Class {
	#name : #VTableFFICalloutMethodBuilder,
	#superclass : #TFCalloutMethodBuilder,
	#category : #'VTable-FFI-Extension'
}

{ #category : #private }
VTableFFICalloutMethodBuilder >> generateFFICallout: builder spec: functionSpec ffiLibrary: ffiLibrary [

	TFCalloutAPI isTracing ifTrue: [ 
		TFCalloutAPI trace: sender. 
		builder 
			pushLiteral: TFCalloutAPI;
			pushLiteral: sender;
			send: #trace: ].
	
	builder 
		pushLiteral: (ffiLibrary uniqueInstance runner).


	builder pushReceiver.
	"save ffi call as literal"
	builder pushLiteral: (self createFFICalloutLiteralFromSpec: functionSpec).
	builder pushLiteral: (self calloutAPI tablePosition).
	builder send:#modifyFFICall:withTablePosition:.

	"iterate arguments in order (in the function) to create the function call"
	
	functionSpec arguments 
		do: [ :each | 
			each emitArgument: builder context: sender inCallout: self requestor.
			each resolvedType tfExternalTypeWithArity emitMarshallToPrimitive: builder ].
	
	"create the array"
	builder pushConsArray: functionSpec arguments size.
	builder addTemp: #argumentsArray.
	builder storeTemp: #argumentsArray.
	
	"send call and store into result"
	builder send: #invokeFunction:withArguments:.

	functionSpec arguments withIndexDo: [ :each :index| 
		each emitReturnArgument: builder context: sender.
		each resolvedType tfExternalTypeWithArity 
			emitFreeIfNeededOfIndex: index
			argumentsArrayTempName: #argumentsArray
			withBuilder: builder  ].
	
	"Additional marshall in the case of TFFI"	
	functionSpec returnType resolvedType tfExternalTypeWithArity emitMarshallFromPrimitive: builder.

	"convert in case return type needs it. And return reseult"	
	
	^ functionSpec returnType
		emitReturn: builder
		resultTempVar: #result
		context: sender
		inCallout: self requestor
]
