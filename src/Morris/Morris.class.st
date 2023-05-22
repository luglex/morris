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

			boardElement ]
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
	super initialize.
	playerA := MorrisPlayer new name: 'A'.
	playerB := MorrisPlayer new name: 'B'.
	fields := (1 to: 24)
			collect: [ :i | 
				MorrisField new
					number: i;
					coordinate: (self fieldCoordinates at: i) ].
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
