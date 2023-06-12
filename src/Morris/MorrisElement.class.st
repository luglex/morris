Class {
	#name : #MorrisElement,
	#superclass : #BlElement,
	#instVars : [
		'morris'
	],
	#category : #Morris
}

{ #category : #accessing }
MorrisElement >> initializeBoard [
	self
		size: 500 @ 500;
		background: Color veryVeryLightGray.
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
MorrisElement >> initializeFields [
	self morris fields
		do: [ :field | 
			| circle |
			circle := BlElement new
					size: 30 @ 30;
					addChild: ((BlTextElement new
							text: (field number asString asRopedText foreground: Color white))
							asScalableElement maxScale: 1);
					background: Color gray;
					geometry: BlCircleGeometry new;
					relocate: field coordinate - (15 @ 15);
					when: BlClickEvent do: [ :event | event target phlow spawnObject: field ].
			self addChild: circle ]
]

{ #category : #accessing }
MorrisElement >> initializeTokens [
	self morris players
		do: [ :aPlayer | 
			| circle |
			aPlayer tokens
				do: [ :aToken | 
					(aToken state isKindOf: MorrisTokenOnField)
						ifTrue: [ circle := BlElement new
									size: 20 @ 20;
									background: aPlayer color;
									geometry: BlCircleGeometry new;
									relocate: aToken state field coordinate - (10 @ 10);
									when: BlClickEvent
										do: [ :event | event target phlow spawnObject: aToken ].
							self addChild: circle ] ].
			(aPlayer tokens
				select: [ :aToken | aToken state isKindOf: MorrisTokenInHand ])
				doWithIndex: [ :aToken :index | 
					circle := BlElement new
							size: 20 @ 20;
							background: aPlayer color;
							geometry: BlCircleGeometry new;
							relocate: (aPlayer = self morris playerA ifTrue: [ 20 ] ifFalse: [ 460 ]) @ (index * 25);
							when: BlClickEvent
								do: [ :event | event target phlow spawnObject: aToken ].
					self addChild: circle ].
			(aPlayer tokens
				select: [ :aToken | aToken state isKindOf: MorrisTokenCaptured ])
				doWithIndex: [ :aToken :index | 
					circle := BlElement new
							size: 20 @ 20;
							background: aPlayer color;
							geometry: BlCircleGeometry new;
							relocate: (aPlayer = self morris playerA ifTrue: [ 460 ] ifFalse: [ 20 ])
									@ (480 - (index * 25));
							when: BlClickEvent
								do: [ :event | event target phlow spawnObject: aToken ].
					self addChild: circle ] ]
]

{ #category : #accessing }
MorrisElement >> morris [
	^ morris
]

{ #category : #accessing }
MorrisElement >> morris: anObject [
	morris := anObject.
	self initializeBoard
]
