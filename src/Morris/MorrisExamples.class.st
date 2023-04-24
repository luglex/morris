Class {
	#name : #MorrisExamples,
	#superclass : #Object,
	#category : #Morris
}

{ #category : #accessing }
MorrisExamples >> emptyMorris [
	<gtExample>
	| morris |
	morris := Morris new.
	self assert: morris players size = 2.
	^ morris
]

{ #category : #accessing }
MorrisExamples >> playerAFromEmptyMorris [
	<gtExample>
	| playerA |
	playerA := self emptyMorris playerA.
	self assert: playerA tokens size = 9.
	self assert: playerA tokens first name = 'A1'.
	^ playerA
]

{ #category : #accessing }
MorrisExamples >> playerBFromEmptyMorris [
	<gtExample>
	| playerB |
	playerB := self emptyMorris playerB.
	self assert: playerB tokens size = 9.
	self assert: playerB tokens first name = 'B1'.
	^ playerB
]