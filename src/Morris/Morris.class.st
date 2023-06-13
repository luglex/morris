Class {
	#name : #Morris,
	#superclass : #Object,
	#instVars : [
		'playerA',
		'playerB',
		'fields',
		'moves'
	],
	#category : #Morris
}

{ #category : #'as yet unclassified' }
Morris >> captureTokenFromFieldNumber: anInteger [
	| opponentPlayer |
	self assert: moves last isFinished not.
	opponentPlayer := self opponentOf: moves last token player.
	opponentPlayer tokens
		detect: [ :aToken | 
			(aToken state isKindOf: MorrisTokenOnField)
				and: [ aToken state field number = anInteger ] ]
		ifFound: [ :aToken | 
			moves last captured: aToken.
			aToken beCaptured ]
		ifNone: [ self error: 'there should be an opponent token on this field' ]
]

{ #category : #accessing }
Morris >> fieldConnections [
	^ {1 -> {2 . 8}.
		2 -> {1 . 3 . 10}.
		3 -> {2 . 4}.
		4 -> {3 . 5. 12}.
		5 -> {4 . 6}.
		6 -> {5 . 7. 14}.
		7 -> {6 . 8}.
		8 -> {1 . 7 . 16}.
		9 -> {10 . 16}.
		10 -> {9 . 11 . 18}.
		11 -> {10 . 12}.
		12 -> {4 . 11 . 13}.
		13 -> {12 . 14}.
		14 -> {6. 13 . 15 . 22}.
		15 -> {14 . 16}.
		16 -> {9 . 15 . 24}.
		17 -> {18 . 24}.
		18 -> {10 . 17 . 19}.
		19 -> {18 . 20}.
		20 -> {12 . 19 . 21}.
		21 -> {22 . 23}.
		22 -> {14 . 21 . 23}.
		23 -> {22 . 24}.
		24 -> {16 . 17 . 23}.}.
]

{ #category : #accessing }
Morris >> fieldCoordinates [
	^ {100 @ 100.
		250 @ 100.
		400 @ 100.
		400 @ 250.
		400 @ 400.
		250 @ 400.
		100 @ 400.
		100 @ 250.
		150 @ 150.
		250 @ 150.
		
		350 @ 150.
		350 @ 250.
		350 @ 350.
		250 @ 350.
		150 @ 350.
		150 @ 250.
		200 @ 200.
		250 @ 200.
		300 @ 200.
		300 @ 250.
		
		300 @ 300.
		250 @ 300.
		200 @ 300.
		200 @ 250}.
]

{ #category : #'as yet unclassified' }
Morris >> fieldHasToken: aField [
	^ self players
		anySatisfy: [ :aPlayer | aPlayer tokens anySatisfy: [ :aToken | aToken isOnField: aField ] ]
]

{ #category : #accessing }
Morris >> fieldNumbersWithPossibleMorris [
	^ {{1.
			2.
			3}.
		{3.
			4.
			5}.
		{5.
			6.
			7}}
]

{ #category : #accessing }
Morris >> fields [
	^ fields
]

{ #category : #accessing }
Morris >> fields: anObject [
	fields := anObject
]

{ #category : #accessing }
Morris >> gtBoardWithFieldNumbersFor: aView [
	<gtView>
	^ aView explicit
		title: 'Board with field numbers';
		priority: 1;
		stencil: [ MorrisElement new morris: self ]
]

{ #category : #accessing }
Morris >> gtFieldsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Fields';
		items: [fields];
		column: 'Field' text: #gtDisplayString;
		column: 'Coordinate' text: [:field | field coordinate gtDisplayString ].
]

{ #category : #accessing }
Morris >> gtMovesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Moves';
		items: [ moves ];
		column: 'Token' text: [ :aMove | aMove token gtDisplayString ];
		column: 'From'
			text: [ :aMove | (aMove fromField ifNil: [ 'In hand' ]) gtDisplayString ];
		column: 'To field' text: [ :aMove | aMove toField gtDisplayString ];
		column: 'Has morris' text: [ :aMove | aMove hasMorris ];
		column: 'Captured' text: [ :aMove | (aMove captured ifNil: ['']) gtDisplayString ]	
]

{ #category : #accessing }
Morris >> hasMorris [
	^ self fieldNumbersWithPossibleMorris anySatisfy: [ :anArray | 
		(anArray includes: moves last token state field number) and: [
			anArray allSatisfy: [ :aFieldNumber | 
				(moves last token player tokens) anySatisfy: [ :aToken | 
					(aToken state isKindOf: MorrisTokenOnField) and: [
						aToken state field number = aFieldNumber ] ]] ] ]
]

{ #category : #accessing }
Morris >> initialize [
	| connectedFields |
	super initialize.
	playerA := MorrisPlayer new name: 'A'; color: Color orange.
	playerB := MorrisPlayer new name: 'B'; color: Color blue.
	fields := (1 to: 24)
			collect: [ :i | 
				MorrisField new
					number: i;
					coordinate: (self fieldCoordinates at: i) ].
	self fieldConnections
		do: [ :each | 
			| field |
			field := fields at: each key.
			connectedFields := each value collect: [ :aNumber | fields at: aNumber].
			field connectedFields: connectedFields ].
	moves := OrderedCollection new
]

{ #category : #accessing }
Morris >> move: aToken toField: aField [
	(aToken canPlayOnField: aField from: self)
		ifFalse: [ self error: 'Token can not move!' ].
	aToken beOnField: aField.
]

{ #category : #accessing }
Morris >> move: aToken toFieldNumber: anInteger [
	| field move |
	field := fields at: anInteger.
	(aToken canPlayOnField: field from: self)
		ifFalse: [ self error: 'Token can not move!' ].
	move := MorrisMove new
			token: aToken;
			toField: field.
	(aToken state isKindOf: MorrisTokenOnField)
		ifTrue: [ move fromField: aToken state field ].
	aToken beOnField: field.
	moves add: move.
	move hasMorris: self hasMorris
]

{ #category : #accessing }
Morris >> moves [
	^ moves
]

{ #category : #accessing }
Morris >> opponentOf: aPlayer [
	^ aPlayer = playerA ifTrue: [ playerB ] ifFalse: [ playerA ]
]

{ #category : #accessing }
Morris >> playerA [
	^playerA
]

{ #category : #accessing }
Morris >> playerA: anObject [
	playerA := anObject
]

{ #category : #'as yet unclassified' }
Morris >> playerB [
	^ playerB
]

{ #category : #accessing }
Morris >> players [
	^ {playerA.playerB}
]

{ #category : #accessing }
Morris >> token: aMorrisToken canPlayOnFieldNumber: anInteger [ 
	| field |
	field := fields at: anInteger.
	^ aMorrisToken canPlayOnField: field from: self
]

{ #category : #accessing }
Morris >> tokenA1 [
	^ playerA token1
]

{ #category : #accessing }
Morris >> tokenA2 [
	^ playerA token2
]

{ #category : #accessing }
Morris >> tokenA3 [
	^ playerA token3
]

{ #category : #accessing }
Morris >> tokenA4 [
	^ playerA token4
]

{ #category : #accessing }
Morris >> tokenA5 [
	^ playerA token5
]

{ #category : #accessing }
Morris >> tokenA6 [
	^ playerA token6
]

{ #category : #accessing }
Morris >> tokenA7 [
	^ playerA token7
]

{ #category : #accessing }
Morris >> tokenA8 [
	^ playerA token8
]

{ #category : #accessing }
Morris >> tokenA9 [
	^ playerA token9
]

{ #category : #'as yet unclassified' }
Morris >> tokenB1 [
	^ playerB token1
]

{ #category : #accessing }
Morris >> tokenB2 [
	^ playerB token2
]

{ #category : #accessing }
Morris >> tokenB3 [
	^ playerB token3
]

{ #category : #accessing }
Morris >> tokenB4 [
	^ playerB token4
]

{ #category : #accessing }
Morris >> tokenB5 [
	^ playerB token5
]

{ #category : #accessing }
Morris >> tokenB6 [
	^ playerB token6
]

{ #category : #accessing }
Morris >> tokenB7 [
	^ playerB token7
]

{ #category : #accessing }
Morris >> tokenB8 [
	^ playerB token8
]

{ #category : #accessing }
Morris >> tokenB9 [
	^ playerB token9
]
