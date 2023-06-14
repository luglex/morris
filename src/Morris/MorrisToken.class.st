Class {
	#name : #MorrisToken,
	#superclass : #Object,
	#instVars : [
		'name',
		'state',
		'player'
	],
	#category : #Morris
}

{ #category : #accessing }
MorrisToken >> asElement [
	^ BlElement new
		size: 20 @ 20;
		background: player color;
		border: (BlBorder paint: player color muchDarker width: 3);
		geometry: BlCircleGeometry new
]

{ #category : #'as yet unclassified' }
MorrisToken >> beCaptured [
	state := MorrisTokenCaptured new
]

{ #category : #'as yet unclassified' }
MorrisToken >> beOnField: aMorrisField [ 
	state := MorrisTokenOnField new field: aMorrisField.
]

{ #category : #accessing }
MorrisToken >> canPlayOnField: aField from: aMorris [
	^ state canPlayOnField: aField from: aMorris
]

{ #category : #accessing }
MorrisToken >> gtDisplayOn: stream [
	stream nextPutAll: name
]

{ #category : #accessing }
MorrisToken >> initialize [
	super initialize.
	state := MorrisTokenInHand new
]

{ #category : #'as yet unclassified' }
MorrisToken >> isCaptured [
	^ state class = MorrisTokenCaptured
]

{ #category : #accessing }
MorrisToken >> isInHand [
	^ state isKindOf: MorrisTokenInHand
]

{ #category : #'as yet unclassified' }
MorrisToken >> isOnField [
	^ state class = MorrisTokenOnField.
]

{ #category : #accessing }
MorrisToken >> isOnField: aMorrisField [ 
	^ self isOnField and: [ state field = aMorrisField ]
]

{ #category : #accessing }
MorrisToken >> isOnFieldNumber: anInteger [
	^ self isOnField and: [ state field number = anInteger ]
]

{ #category : #'as yet unclassified' }
MorrisToken >> name [
	^ name
]

{ #category : #accessing }
MorrisToken >> name: aString [ 
	name := aString
]

{ #category : #accessing }
MorrisToken >> player [
	^ player
]

{ #category : #accessing }
MorrisToken >> player: aPlayer [
	player := aPlayer
]

{ #category : #accessing }
MorrisToken >> state [
	^ state
]
