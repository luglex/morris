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
	self assert: morris fields size = 24.
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisPlayer [
	<gtExample>
	| morris tokenA1 field5 |
	morris := self emptyMorris.
	tokenA1 := morris tokenA1.
	field5 := morris fields fifth.
	self assert: (field5 isKindOf: MorrisField).
	self assert: tokenA1 isInHand.
	self assert: tokenA1 isOnField not.
	tokenA1 beOnField: field5.
	self assert: tokenA1 isOnField.
	self assert: (tokenA1 isOnFieldNumber: 5).
	self assert: tokenA1 isInHand not.
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisWithTokenA1OnField [
	<gtExample>
	| morris tokenA1 field5 |
	morris := self emptyMorris.
	tokenA1 := morris tokenA1.
	field5 := morris fields fifth.
	self assert: (field5 isKindOf: MorrisField).
	self assert: tokenA1 isInHand.
	self assert: tokenA1 isOnField not.
	tokenA1 beOnField: field5.
	self assert: tokenA1 isOnField.
	self assert: (tokenA1 isOnFieldNumber: 5).
	self assert: tokenA1 isInHand not.
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisWithTokenB1WantingToMoveIlegally [
	<gtExample>
	| morris tokenB1 |
	morris := self morrisWithTokenA1OnField.
	tokenB1 := morris tokenB1.
	self assert: (morris token: tokenB1 canPlayOnField: 5) not.
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisWithTokenB1WantingToMoveLegally [
	<gtExample>
	| morris tokenB1 |
	morris := self morrisWithTokenA1OnField.
	tokenB1 := morris tokenB1.
	self assert: (morris token: tokenB1 canPlayOnField: 2).
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisWithTwoPlayerACapturedTokens [
	<gtExample>
	| morris playerA tokenA1 tokenA2 |
	morris := self emptyMorris.
	playerA := morris playerA.
	tokenA1 := playerA tokens first.
	tokenA2 := playerA tokens second.
	tokenA1 beCaptured.
	tokenA2 beCaptured.
	self assert: tokenA1 isCaptured.
	self assert: tokenA2 isCaptured.
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisWithTwoPlayerBCapturedTokens [
	<gtExample>
	| morris  tokenB1 tokenB2 playerB |
	morris := self emptyMorris.
	playerB := morris playerB.
	tokenB1 := playerB tokens first.
	tokenB2 := playerB tokens second.
	tokenB1 beCaptured.
	tokenB2 beCaptured.
	self assert: tokenB1 isCaptured.
	self assert: tokenB2 isCaptured.
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

{ #category : #accessing }
MorrisExamples >> tokenA1AndTokenB1 [
	<gtExample>
	| morris tokenB1 playerB tokenB2 tokenA1 tokenA2 playerA field2 field3 field1 field24 |
	morris := self morrisWithTokenA1OnField.
	playerB := morris playerB.
	playerA := morris playerA.
	tokenA1 := playerA tokens first.
	tokenA2 := playerA tokens second.
	tokenB1 := playerB tokens first.
	tokenB2 := playerB tokens second.
	field2 := morris fields second.
	field3 := morris fields third.
	field1 := morris fields first.
	field24 := morris fields at: 24.
	tokenA1 beOnField: field2.
	tokenA2 beOnField: field3.
	tokenB1 beOnField: field1.
	tokenB2 beOnField: field24.
	self assert: (tokenA1 isOnFieldNumber: 2).
	self assert: (tokenA2 isOnFieldNumber: 3).
	self assert: (tokenB1 isOnFieldNumber: 1).
	self assert: (tokenB2 isOnFieldNumber: 24).
	self assert: (morris token: tokenB1 canPlayOnField: 5) not.
	self assert: (morris token: tokenB1 canPlayOnField: 2) not.
	self assert: (morris token: tokenB1 canPlayOnField: 8).
	^ morris
]

{ #category : #accessing }
MorrisExamples >> tokenA1OnField5 [
	<gtExample>
	| morris playerA tokenA1 field5 |
	morris := self emptyMorris.
	playerA := morris playerA.
	tokenA1 := playerA tokens first.
	field5 := morris fields fifth.
	self assert: (field5 isKindOf: MorrisField).
	self assert: tokenA1 isInHand.
	self assert: tokenA1 isOnField not.
	tokenA1 beOnField: field5.
	self assert: tokenA1 isOnField.
	self assert: (tokenA1 isOnFieldNumber: 5).
	self assert: tokenA1 isInHand not.
	^ morris
]

{ #category : #accessing }
MorrisExamples >> tokensOfPlayerAFromEmptyMorris [
	<gtExample>
	| playerA tokenA1 |
	playerA := self playerAFromEmptyMorris.
	tokenA1 := playerA tokens first.
	self assert: tokenA1 isInHand.
	^ playerA
]
