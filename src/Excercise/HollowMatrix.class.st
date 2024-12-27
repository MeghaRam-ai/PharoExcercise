"
To encode a hollow matrix from a matrix in its traditional form (array of arrays). This program must create the hollow matrix representation from its traditional representation, and conversely, create the traditional representation from the hollow matrix representation.
"
Class {
	#name : 'HollowMatrix',
	#superclass : 'Object',
	#instVars : [
		'dimension'
	],
	#category : 'Excercise',
	#package : 'Excercise'
}

{ #category : 'operation' }
HollowMatrix >> arraysFromhollowMatrix [
	"This method handles the user input and conversion of hollow to traditional matrix"

	"scope: class-variables  &  instance-variables"

	| input nonZeroElements traditionalArray aHollowMatrix |
	input := UIManager default request:
		         'Enter the size n (of nXn matrix) of hollow matrix'.
	(input isNil or: [ input isEmpty ]) ifTrue: [
		UIManager default inform: 'Input cannot be empty'.
		^ self ].
	(input allSatisfy: [ :char | char isDigit or: [ char = $- ] ])
		ifFalse: [
			UIManager default inform: 'Please enter a valid integer'.
			^ self ].

	dimension := input asInteger.

	aHollowMatrix := self hollowMatrix.
	aHollowMatrix := self populateHollowMatrix: aHollowMatrix.

	nonZeroElements := self calculateNonZeroElements: aHollowMatrix.

	traditionalArray := self
		                    convertToTraditionalArray: nonZeroElements
		                    and: aHollowMatrix.

	^ traditionalArray
]

{ #category : 'operation' }
HollowMatrix >> calculateNonZeroElements: aHollowMatrix [
	"To calculate the non zero elements. "

	"scope: class-variables  &  instance-variables"

	| nonZeroElements |
	nonZeroElements := 0.

	1 to: dimension do: [ :row |
		1 to: dimension do: [ :column |
			(row = column or: [ column = (dimension - row + 1) ]) ifTrue: [
				((aHollowMatrix at: row) at: column) ~= 0 ifTrue: [
					nonZeroElements := nonZeroElements + 1 ] ] ] ].

	^ nonZeroElements
]

{ #category : 'operation' }
HollowMatrix >> convertToTraditionalArray: nonZeroElements and: aHollowMatrix [
	"For the conversion of array to hollow matrix. Number of non zero elements will be the number of columns of traditional array"

	"scope: class-variables  &  instance-variables"

	| traditionalArray k |
	traditionalArray := Array new: 3.

	traditionalArray := (1 to: 3) collect: [ :position |
		                    traditionalArray
			                    at: position
			                    put: (Array new: nonZeroElements) ].

	k := 1.
	1 to: dimension do: [ :row |
		1 to: dimension do: [ :column |
			((aHollowMatrix at: row) at: column) ~= 0 ifTrue: [
				(traditionalArray at: 1) at: k put: row.
				(traditionalArray at: 2) at: k put: column.
				(traditionalArray at: 3)
					at: k
					put: ((aHollowMatrix at: row) at: column).
				k := k + 1 ] ] ].
	^ traditionalArray
]

{ #category : 'accessing' }
HollowMatrix >> dimension [
	^ dimension
]

{ #category : 'accessing' }
HollowMatrix >> dimension: anObject [

	dimension := anObject
]

{ #category : 'accessing' }
HollowMatrix >> hollowMatrix [
	"To initialise hollow matrix with all zeros"

	| hollowMatrix |
	hollowMatrix := Array new: dimension.
	hollowMatrix := (1 to: dimension) collect: [ :position |
		                Array new: dimension withAll: 0 ].
	^ hollowMatrix
]

{ #category : 'initialization' }
HollowMatrix >> initialize [
	"scope: class-variables  &  instance-variables"

	super initialize
]

{ #category : 'operation' }
HollowMatrix >> populateHollowMatrix: hollowMatrix [
	"To populate hollow matrix from user input"

	"scope: class-variables  &  instance-variables"

	| item |
	1 to: dimension do: [ :row |
		1 to: dimension do: [ :column |
			(row = column or: [ column = (dimension - row + 1) ]) ifTrue: [
				item := UIManager default request:
					        'Enter the value at (' , row printString , ','
					        , column printString , ')'.
				(item allSatisfy: [ :char | char isDigit or: [ char = $- ] ])
					ifFalse: [
						UIManager default inform: 'Please enter a valid integer'.
						^ self ].
				item := item asInteger.
				(hollowMatrix at: row) at: column put: item ] ] ].

	^ hollowMatrix
]
