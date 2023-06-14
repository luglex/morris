Class {
	#name : #MorrisElement,
	#superclass : #BlElement,
	#instVars : [
		'morris',
		'selectedToken'
	],
	#category : #Morris
}

{ #category : #accessing }
MorrisElement >> hasSelectedToken [
	^ selectedToken notNil
]

{ #category : #accessing }
MorrisElement >> initializeBoard [
	self
		size: 500 @ 500;
		background: Color white;
		aptitude: BrShadowAptitude new beLarge;
		margin: (BlInsets all: 20).
	self removeChildren.
	self initializePlayerLabels.
	self initializeFields.
	self initializeFieldConnections.
	self initializeTokens
]

{ #category : #accessing }
MorrisElement >> initializeFieldConnections [
	self morris fields
		do: [ :aField | 
			| line |
			aField connectedFields
				do: [ :aConnectedField | 
					line := BlLineElement new
							zIndex: -1;
							fromAnchor: (BlAbsolutePositionAnchor position: aField coordinate);
							toAnchor: (BlAbsolutePositionAnchor position: aConnectedField coordinate);
							border: (BlBorder paint: Color black width: 1).
					self addChild: line ] ]
]

{ #category : #accessing }
MorrisElement >> initializeFieldTokensOfPlayer: aPlayer [
	| circle |
	aPlayer tokens
		do: [ :aToken | 
			(aToken state isKindOf: MorrisTokenOnField)
				ifTrue: [ circle := aToken asElement
							relocate: aToken state field coordinate - (10 @ 10);
							when: BlClickEvent
								do: [ :event | 
									event modifiers isPrimaryModifier
										ifTrue: [ event target phlow spawnObject: aToken ]
										ifFalse: [ selectedToken isNil
												ifTrue: [ selectedToken := aToken ]
												ifFalse: [ morris moves last isFinished not
														ifTrue: [ selectedToken := nil.
															morris captureTokenFromFieldNumber: aToken state field number.
															self initializeBoard ] ] ] ].
					self addChild: circle ] ]
]

{ #category : #accessing }
MorrisElement >> initializeFields [
	self morris fields
		do: [ :field | 
			| circle |
			circle := field asElementWithNumber
					relocate: field coordinate - (15 @ 15);
					when: BlClickEvent
						do: [ :event | 
							event modifiers isPrimaryModifier
								ifTrue: [ event target phlow spawnObject: field ]
								ifFalse: [ selectedToken notNil
										ifTrue: [ morris move: selectedToken toFieldNumber: field number.
											self initializeBoard.
											morris hasMorris ifFalse: [ selectedToken := nil ] ] ] ].
			self addChild: circle ]
]

{ #category : #accessing }
MorrisElement >> initializePlayerLabels [
	morris isGameOver
		ifTrue: [ | gameOverLabel |
			gameOverLabel := BrLabel new
					text: 'Player ', morris moves last player name , ' has won the game!';
					aptitude: (BrGlamorousLabelAptitude new 					fontSize: 20);
					background: morris moves last player color;
					width: 400;
					alignCenter;
					relocate: 50 @ 5.
			self addChild: gameOverLabel ]
		ifFalse: [ | playerALabel playerBLabel |
			playerALabel := BrLabel new
					text: 'Player A';
					aptitude: BrGlamorousLabelAptitude;
					background: (morris isPlayerAToMove
							ifTrue: [ morris playerA color ]
							ifFalse: [ Color transparent ]);
					width: 60;
					alignCenter;
					relocate: 5 @ 5.
			playerBLabel := BrLabel new
					text: 'Player B';
					aptitude: BrGlamorousLabelAptitude;
					background: (morris isPlayerAToMove not
							ifTrue: [ morris playerB color ]
							ifFalse: [ Color transparent ]);
					width: 60;
					alignCenter;
					relocate: 435 @ 5.
			self addChild: playerALabel.
			self addChild: playerBLabel ]
]

{ #category : #accessing }
MorrisElement >> initializeTokens [
	self morris players
		do: [ :aPlayer | 
			| circle |
			self initializeFieldTokensOfPlayer: aPlayer.
			(aPlayer tokens
				select: [ :aToken | aToken state isKindOf: MorrisTokenInHand ])
				doWithIndex: [ :aToken :index | 
					circle := aToken asElement
							relocate: (aPlayer = self morris playerA ifTrue: [ 25 ] ifFalse: [ 455 ]) @ (index * 25 + 20);
							when: BlClickEvent
								do: [ :event | 
									event modifiers isPrimaryModifier
										ifTrue: [ event target phlow spawnObject: aToken ]
										ifFalse: [ selectedToken isNil ifTrue: [ selectedToken := aToken ] ] ].
					self addChild: circle ].
			(aPlayer tokens
				select: [ :aToken | aToken state isKindOf: MorrisTokenCaptured ])
				doWithIndex: [ :aToken :index | 
					circle := aToken asElement
							relocate: (aPlayer = self morris playerA ifTrue: [ 455 ] ifFalse: [ 25 ])
									@ (480 - (index * 25));
							when: BlClickEvent
								do: [ :event | 
									event modifiers isPrimaryModifier
										ifTrue: [ event target phlow spawnObject: aToken ] ].
					self addChild: circle ] ]
]

{ #category : #accessing }
MorrisElement >> isMoveStarted [
	^ selectedToken notNil
]

{ #category : #accessing }
MorrisElement >> isToCaptureAfterMorris [
	^ self hasSelectedToken not and: [ morris hasMorris ]
]

{ #category : #accessing }
MorrisElement >> morris [
	^ morris
]

{ #category : #accessing }
MorrisElement >> morris: aMorris [
	morris := aMorris.
	self initializeBoard
]
