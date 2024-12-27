"
TraditionalArray
"
Class {
	#name : 'TraditionalArray',
	#superclass : 'Object',
	#instVars : [
		'traditionalArray',
		'dimension',
		'nonZeroElements'
	],
	#category : 'Excercise',
	#package : 'Excercise'
}

{ #category : 'operation' }
TraditionalArray >> calculateDimensionOfHollowMatrix [
	"To calculate the dimetion of resulting hollow matrix.
	Dimension will be the maximum value in the 1st or 2nd row elements of traditional array.
	"

	"scope: class-variables  &  instance-variables"

	dimension := (traditionalArray at: 1) max max:
		             (traditionalArray at: 2) max
]

{ #category : 'accessing' }
TraditionalArray >> dimension [

	^ dimension
]

{ #category : 'accessing' }
TraditionalArray >> dimension: anObject [

	dimension := anObject
]

{ #category : 'operation' }
TraditionalArray >> hollowMatrixFromArrays [
	"Main function to calculate hollow matrix representation from its traditional representation(array of arrays)"

	"scope: class-variables  &  instance-variables"

	| hollowMatrix |
	self nonZeroElements:
		(UIManager default request: 'Enter the number of non zero elements')
			asInteger.
	self readArrayElements.
	self calculateDimensionOfHollowMatrix.
	hollowMatrix := self initHollowMatrix.
	hollowMatrix := self populateHollowMatrix: hollowMatrix.
	^ hollowMatrix
]

{ #category : 'initialization' }
TraditionalArray >> initHollowMatrix [
	"Initialisatin with all zeros"

	"scope: class-variables  &  instance-variables"

	| hollowMatrix |
	hollowMatrix := Array new: dimension.
	hollowMatrix := (1 to: dimension) collect: [ :position |
		                Array new: dimension withAll: 0 ].
	^ hollowMatrix
]

{ #category : 'initialization' }
TraditionalArray >> initialize [
	"Traditional array rows initialization. Size of row will always be 3"

	"scope: class-variables  &  instance-variables"

	traditionalArray := Array new: 3.
	super initialize
]

{ #category : 'accessing' }
TraditionalArray >> nonZeroElements [

	^ nonZeroElements
]

{ #category : 'accessing' }
TraditionalArray >> nonZeroElements: anObject [

	nonZeroElements := anObject
]

{ #category : 'operation' }
TraditionalArray >> populateHollowMatrix: hollowMatrix [
	"Population of resulting hollow matrix from the values of traditional array"

	| rowIndex colIndex item |
	1 to: nonZeroElements do: [ :colPosition |
		rowIndex := (traditionalArray at: 1) at: colPosition.
		colIndex := (traditionalArray at: 2) at: colPosition.
		item := (traditionalArray at: 3) at: colPosition.
		(hollowMatrix at: rowIndex) at: colIndex put: item ].

	^ hollowMatrix
]

{ #category : 'operation' }
TraditionalArray >> readArrayElements [
	"To read the elements of traditional array.
	Enter the elements like all elements of a row at a time, then second and then third.
	"

	"scope: class-variables  &  instance-variables"

	| row |
	1 to: 3 do: [ :i |
		row := UIManager default request:
			       'Enter the elements of row ' , i printString.
		row := row splitOn: ' '.
		row := row collect: [ :each | each asInteger ].
		traditionalArray at: i put: row asArray ]
]

{ #category : 'accessing' }
TraditionalArray >> traditionalArray [

	^ traditionalArray.
]

{ #category : 'accessing' }
TraditionalArray >> traditionalArray: anObject [

	traditionalArray := anObject
]
