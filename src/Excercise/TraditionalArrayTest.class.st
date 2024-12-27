Class {
	#name : 'TraditionalArrayTest',
	#superclass : 'TestCase',
	#instVars : [
		'traditionalArrayObj'
	],
	#category : 'Excercise',
	#package : 'Excercise'
}

{ #category : 'running' }
TraditionalArrayTest >> setUp [

	super setUp.
	traditionalArrayObj := TraditionalArray new.
	traditionalArrayObj nonZeroElements: 5.
	traditionalArrayObj traditionalArray:
		(Array
			 with: #( 1 1 2 3 3 )
			 with: #( 1 3 2 1 3 )
			 with: #( 1 2 3 4 5 ))
]

{ #category : 'tests' }
TraditionalArrayTest >> testCalculateDimensionOfHollowMatrix [
	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	traditionalArrayObj calculateDimensionOfHollowMatrix.
	self assert: traditionalArrayObj dimension equals: 3
]

{ #category : 'tests' }
TraditionalArrayTest >> testInitHollowMatrix [
	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	| resultingHollowMatrix |
	traditionalArrayObj calculateDimensionOfHollowMatrix.
	resultingHollowMatrix := traditionalArrayObj initHollowMatrix.
	self assert: resultingHollowMatrix size equals: 3
]

{ #category : 'tests' }
TraditionalArrayTest >> testPopulateHollowMatrix [
	"Test the main result"

	"scope: class-variables  &  instance-variables"

	| resultingHollowMatrix result |
	traditionalArrayObj calculateDimensionOfHollowMatrix.
	resultingHollowMatrix := traditionalArrayObj initHollowMatrix.
	result := traditionalArrayObj populateHollowMatrix:
		          resultingHollowMatrix.

	self assert: ((result at: 1) at: 1) equals: 1.
	self assert: ((result at: 1) at: 3) equals: 2.
	self assert: ((result at: 2) at: 2) equals: 3.
	self assert: ((result at: 3) at: 1) equals: 4.
	self assert: ((result at: 3) at: 3) equals: 5
]
