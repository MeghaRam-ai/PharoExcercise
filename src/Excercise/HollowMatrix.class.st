Class {
	#name : 'HollowMatrix',
	#superclass : 'Object',
	#category : 'Excercise',
	#package : 'Excercise'
}

{ #category : 'as yet unclassified' }
HollowMatrix >> arraysFromhollowMatrix [
	"Hollow matrix representation from its traditional representation(array of arrays)"
	"scope: class-variables  &  instance-variables"


	| nonZeroElements traditionalArray dimension hollowMatrix maxRow maxCol item k|
	
	dimension := (UIManager default request: 'Enter the size n (of nXn matrix) of hollow matrix') asInteger .
	hollowMatrix:= Array new:dimension.
	1 to: dimension do:[:position|
		hollowMatrix at: position put: (Array new:dimension withAll:0).
		].
	
	nonZeroElements:=0.
	1 to: dimension do:[:row|
		1 to: dimension do: [ :column|
			(row = column or: [column = (dimension - row + 1)]) ifTrue: [ 
				item:= (UIManager default request: ('Enter the value at (', row printString, ',', column printString, ')')) asInteger.
				(hollowMatrix at: row) at:column put: item.
				item~=0 ifTrue: [nonZeroElements:=nonZeroElements+1].
			 ].
		]. 
	].
	
	maxRow := 3.
	maxCol := nonZeroElements.
	
	traditionalArray:= Array new:3.
	1 to: 3 do:[:i|
		traditionalArray at: i put: (Array new:nonZeroElements).
		].
	
	
	k := 1.
	1 to: dimension do: [:row|
		1 to: dimension do: [:column|
			((hollowMatrix at: row) at: column) ~=0 ifTrue: [ 
				(traditionalArray at: 1) at:k put: row.
				(traditionalArray at: 2) at:k put: column.
				(traditionalArray at: 3) at:k put: ((hollowMatrix at: row) at: column).
				k:=k+1.
				 ].
		 ].
	].
	
	
	^traditionalArray 

]

{ #category : 'as yet unclassified' }
HollowMatrix >> hollowMatrixFromArrays [
	"Hollow matrix representation from its traditional representation(array of arrays)"
	"scope: class-variables  &  instance-variables"


	| nonZeroElements traditionalArray row dimension hollowMatrix rowIndex colIndex item|
	nonZeroElements := (UIManager default request: 'Enter the number of non zero elements') asInteger .
	traditionalArray:= Array new:3.
	
	1 to: 3 do:[:i|
		row := (UIManager default request: 'Enter the elements of row ', i printString).
		row := row splitOn: ' '.
		row := row collect: [ :each|each asInteger ].
		traditionalArray at: i put: row asArray.
		].
	
	dimension := (traditionalArray at:1)max max:(traditionalArray at:1)max.
	hollowMatrix:= Array new:dimension.
	
	1 to: dimension do:[:position|
		hollowMatrix at: position put: (Array new:dimension withAll:0).
		].
	
	1 to: nonZeroElements do: [ :colPosition|
		rowIndex:= (traditionalArray at: 1) at:colPosition.
		colIndex:= (traditionalArray at: 2) at:colPosition.
		item:= (traditionalArray at: 3) at:colPosition.
		(hollowMatrix at: rowIndex) at:colIndex put: item.
		 ].
	
	^hollowMatrix 

]
