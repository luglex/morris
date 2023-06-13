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
MorrisExamples >> morrisGameA1To5 [
	<gtExample>
	| morris |
	morris := self emptyMorris.
	morris move: morris tokenA1 toFieldNumber: 5.
	self assert: (morris tokenA1 isOnFieldNumber: 5).
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisGameA2From14To6 [
	<gtExample>
	| morris |
	morris := self morrisGameB9To3.
	morris move: morris tokenA2 toFieldNumber: 6.
	self assert: (morris tokenA2 isOnFieldNumber: 6).
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisGameA2To14 [
	<gtExample>
	| morris |
	morris := self morrisGameB1To23.
	morris move: morris tokenA2 toFieldNumber: 14.
	self assert: (morris tokenA2 isOnFieldNumber: 14).
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisGameA3To15 [
	<gtExample>
	| morris |
	morris := self morrisGameB2To24.
	morris move: morris tokenA3 toFieldNumber: 15.
	self assert: (morris tokenA3 isOnFieldNumber: 15).
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisGameA4To1 [
	<gtExample>
	| morris |
	morris := self morrisGameB3To19.
	morris move: morris tokenA4 toFieldNumber: 1.
	self assert: (morris tokenA4 isOnFieldNumber: 1).
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisGameA5To22 [
	<gtExample>
	| morris |
	morris := self morrisGameB4To13.
	morris move: morris tokenA5 toFieldNumber: 22.
	self assert: (morris tokenA5 isOnFieldNumber: 22).
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisGameA6To8 [
	<gtExample>
	| morris |
	morris := self morrisGameB5To8.
	morris move: morris tokenA6 toFieldNumber: 9.
	self assert: (morris tokenA6 isOnFieldNumber: 9).
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisGameA7To18 [
	<gtExample>
	| morris |
	morris := self morrisGameB6To10.
	morris move: morris tokenA7 toFieldNumber: 18.
	self assert: (morris tokenA7 isOnFieldNumber: 18).
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisGameA8To20 [
	<gtExample>
	| morris |
	morris := self morrisGameB7To21.
	morris move: morris tokenA8 toFieldNumber: 20.
	self assert: (morris tokenA8 isOnFieldNumber: 20).
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisGameA9To7 [
	<gtExample>
	| morris |
	morris := self morrisGameB8To12.
	morris move: morris tokenA9 toFieldNumber: 7.
	self assert: (morris tokenA9 isOnFieldNumber: 7).
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisGameB1To23 [
	<gtExample>
	| morris |
	morris := self morrisGameA1To5.
	
	"morris move: morris tokenA2 toFieldNumber: 14.
	self assert: (morris tokenA2 isOnFieldNumber: 14).
	
	morris move: morris tokenA3 toFieldNumber: 6.
	self assert: (morris tokenA3 isOnFieldNumber: 6).
		"
	morris move: morris tokenB1 toFieldNumber: 23.
	self assert: (morris tokenB1 isOnFieldNumber: 23).
	
	"morris move: morris tokenB2 toFieldNumber: 24.
	self assert: (morris tokenB2 isOnFieldNumber: 24).
	
	morris move: morris tokenB3 toFieldNumber: 16.
	self assert: (morris tokenB3 isOnFieldNumber: 16).
	self should: [ morris move: morris tokenB2 toFieldNumber: 5 ] raise: Error."
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisGameB2To24 [
	<gtExample>
	| morris |
	morris := self morrisGameA2To14.
	morris move: morris tokenB2 toFieldNumber: 24.
	self assert: (morris tokenB2 isOnFieldNumber: 24).
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisGameB3To19 [
	<gtExample>
	| morris |
	morris := self morrisGameA3To15.
	morris move: morris tokenB3 toFieldNumber: 19.
	self assert: (morris tokenB3 isOnFieldNumber: 19).
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisGameB4To13 [
	<gtExample>
	| morris |
	morris := self morrisGameA4To1.
	morris move: morris tokenB4 toFieldNumber: 13.
	self assert: (morris tokenB4 isOnFieldNumber: 13).
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisGameB5To8 [
	<gtExample>
	| morris |
	morris := self morrisGameA5To22.
	morris move: morris tokenB5 toFieldNumber: 8.
	self assert: (morris tokenB5 isOnFieldNumber: 8).
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisGameB6To10 [
	<gtExample>
	| morris |
	morris := self morrisGameA6To8.
	morris move: morris tokenB6 toFieldNumber: 10.
	self assert: (morris tokenB6 isOnFieldNumber: 10).
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisGameB7To21 [
	<gtExample>
	| morris |
	morris := self morrisGameA7To18.
	morris move: morris tokenB7 toFieldNumber: 21.
	self assert: (morris tokenB7 isOnFieldNumber: 21).
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisGameB8To12 [
	<gtExample>
	| morris |
	morris := self morrisGameA8To20.
	morris move: morris tokenB8 toFieldNumber: 12.
	self assert: (morris tokenB8 isOnFieldNumber: 12).
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisGameB9To3 [
	<gtExample>
	| morris |
	morris := self morrisGameA9To7.
	morris move: morris tokenB9 toFieldNumber: 3.
	self assert: (morris tokenB9 isOnFieldNumber: 3).
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisMoveA1To5 [
	<gtExample>
	| morris tokenA1 field5 |
	morris := self emptyMorris.
	tokenA1 := morris tokenA1.
	field5 := morris fields fifth.
	self assert: (field5 isKindOf: MorrisField).
	self assert: tokenA1 isInHand.
	self assert: tokenA1 isOnField not.
	morris move: tokenA1 toField: field5.
	self assert: tokenA1 isOnField.
	self assert: (tokenA1 isOnFieldNumber: 5).
	self assert: tokenA1 isInHand not.
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
	self assert: (morris token: tokenB1 canPlayOnFieldNumber: 5) not.
	^ morris
]

{ #category : #accessing }
MorrisExamples >> morrisWithTokenB1WantingToMoveLegally [
	<gtExample>
	| morris tokenB1 |
	morris := self morrisWithTokenA1OnField.
	tokenB1 := morris tokenB1.
	self assert: (morris token: tokenB1 canPlayOnFieldNumber: 2).
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
	self assert: (morris token: tokenB1 canPlayOnFieldNumber: 5) not.
	self assert: (morris token: tokenB1 canPlayOnFieldNumber: 2) not.
	self assert: (morris token: tokenB1 canPlayOnFieldNumber: 8).
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
