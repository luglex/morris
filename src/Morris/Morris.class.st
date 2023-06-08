Class {
	#name : #Morris,
	#superclass : #Object,
	#instVars : [
		'playerA',
		'playerB',
		'fields'
	],
	#category : #Morris
}

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
		14 -> {13 . 15 . 22}.
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

{ #category : #accessing }
Morris >> fields [
	^ fields
]

{ #category : #accessing }
Morris >> gtBoardFor: aView [
	<gtView>
	| boardElement circle line |
	^ aView explicit
		title: 'Board';
		priority: 10;
		stencil: [ boardElement := BlElement new
					size: 500 @ 500;
					background: Color veryVeryLightGray.
			self fields
				do: [ :field | 
					circle := BlElement new
							size: 30 @ 30;
							addChild: ((BlTextElement new
									text: (field number asString asRopedText foreground: Color white))
									asScalableElement maxScale: 1);
							background: Color black;
							geometry: BlCircleGeometry new;
							relocate: field coordinate - (15 @ 15);
							when: BlClickEvent
								do: [ :event | event target phlow spawnObject: field ].
					boardElement addChild: circle ].

			{100 @ 100 -> (250 @ 100).
				250 @ 100 -> (400 @ 100).
				400 @ 100 -> (400 @ 250).
				400 @ 250 -> (400 @ 400).
				400 @ 400 -> (250 @ 400).
				250 @ 400 -> (100 @ 400).
				100 @ 400 -> (100 @ 250).
				100 @ 400 -> (100 @ 100).
				150 @ 150 -> (250 @ 150).
				250 @ 150 -> (350 @ 150).
				350 @ 150 -> (350 @ 250).
				350 @ 250 -> (350 @ 350).
				350 @ 350 -> (250 @ 350).
				250 @ 350 -> (150 @ 350).
				150 @ 350 -> (150 @ 250).
				150 @ 250 -> (150 @ 150).
				350 @ 350 -> (250 @ 350).
				200 @ 200 -> (250 @ 200).
				250 @ 200 -> (300 @ 200).
				300 @ 200 -> (300 @ 250).
				300 @ 250 -> (300 @ 300).
				300 @ 300 -> (250 @ 300).
				250 @ 300 -> (200 @ 300).
				200 @ 300 -> (200 @ 250).
				200 @ 250 -> (200 @ 200).
				100 @ 250 -> (200 @ 250).
				250 @ 400 -> (250 @ 300).
				400 @ 250 -> (300 @ 250).
				250 @ 100 -> (250 @ 200)}
				do: [ :association | 
					line := BlLineElement new
							fromAnchor: (BlAbsolutePositionAnchor position: association key);
							toAnchor: (BlAbsolutePositionAnchor position: association value);
							border: (BlBorder paint: Color black width: 1).
					boardElement addChild: line ].

			boardElement ].
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
Morris >> initialize [
	| connectedFields |
	super initialize.
	playerA := MorrisPlayer new name: 'A'.
	playerB := MorrisPlayer new name: 'B'.
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
			field connectedFields: connectedFields ]
]

{ #category : #accessing }
Morris >> playerA [
	^playerA
]

{ #category : #'as yet unclassified' }
Morris >> playerB [
	^ playerB
]

{ #category : #accessing }
Morris >> players [
	^ {playerA.playerB}
]
