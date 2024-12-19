Class {
	#name : 'HollowMatrixTest',
	#superclass : 'TestCase',
	#category : 'Excercise',
	#package : 'Excercise'
}

{ #category : 'tests' }
HollowMatrixTest >> testHollowMatrixInitialization [
	"To test if hollow matrix initialised to zero"

	"scope: class-variables  &  instance-variables"

	| size hollowMatrixObj |
	size := 3.
	hollowMatrixObj := HollowMatrix new.
	hollowMatrixObj initializeHollowMatrix: size.
	self assert: hollowMatrixObj dimension equals: size.
	self assert: ((hollowMatrixObj hollowMatrix at: 1) size) equals: size.
	hollowMatrixObj hollowMatrix do: [ :subArr| subArr allSatisfy: [:value| value=0 ]]
]
