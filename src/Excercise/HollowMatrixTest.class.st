Class {
	#name : 'HollowMatrixTest',
	#superclass : 'TestCase',
	#instVars : [
		'hollowMatrixObj'
	],
	#category : 'Excercise',
	#package : 'Excercise'
}

{ #category : 'running' }
HollowMatrixTest >> setUp [

	super setUp.
	hollowMatrixObj := HollowMatrix new.
	hollowMatrixObj dimension: 3
]

{ #category : 'tests' }
HollowMatrixTest >> testArraysFromhollowMatrix [
	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	| aHollowMatrix traditionalArray |
	aHollowMatrix := hollowMatrixObj hollowMatrix.
	aHollowMatrix := #( #( 1 0 1 ) #( 0 1 0 ) #( 0 0 1 ) ).
	traditionalArray := hollowMatrixObj
		                    convertToTraditionalArray: 4
		                    and: aHollowMatrix.

	self assert: 4 < (2 * hollowMatrixObj dimension) "if N is even, total number of nonzero elements are <= 2N, if N is odd, it <=2N-1"
]

{ #category : 'tests' }
HollowMatrixTest >> testConvertToTraditionalArray [
	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	| traditionalArray hollowMatrix |
	hollowMatrix := hollowMatrixObj hollowMatrix.
	hollowMatrix := #( #( 5 0 6 ) #( 0 4 0 ) #( 0 0 3 ) ).

	traditionalArray := hollowMatrixObj
		                    convertToTraditionalArray: 4
		                    and: hollowMatrix.
	self assert: ((traditionalArray at: 3) at: 1) equals: 5.
	self assert: ((traditionalArray at: 3) at: 2) equals: 6.
	self assert: ((traditionalArray at: 3) at: 3) equals: 4.
	self assert: ((traditionalArray at: 3) at: 4) equals: 3
]

{ #category : 'tests' }
HollowMatrixTest >> testHollowMatrix [
	"To test if hollow matrix initialised to zero"

	"scope: class-variables  &  instance-variables"

	self assert: hollowMatrixObj hollowMatrix size equals: 3.
	self assert:
		(hollowMatrixObj hollowMatrix allSatisfy: [ :row | row size = 3 ])
]

{ #category : 'tests' }
HollowMatrixTest >> testPopulateHollowMatrix [
	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	| aHollowMatrix hollowMatrixPopulated |
	aHollowMatrix := hollowMatrixObj hollowMatrix.
	hollowMatrixPopulated := Array
		                         with: #( 1 0 1 )
		                         with: #( 0 1 0 )
		                         with: #( 0 0 1 ).
	self assert: aHollowMatrix size equals: hollowMatrixPopulated size.
	1 to: hollowMatrixObj dimension do: [ :row |
		1 to: hollowMatrixObj dimension do: [ :column |
			(row = column or: [ column = (hollowMatrixObj dimension - row + 1) ])
				ifFalse: [
				self
					assert: ((hollowMatrixPopulated at: row) at: column)
					equals: 0 ] ] ]
]
