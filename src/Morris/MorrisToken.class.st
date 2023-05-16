Class {
	#name : #MorrisToken,
	#superclass : #Object,
	#instVars : [
		'name',
		'state'
	],
	#category : #Morris
}

{ #category : #'as yet unclassified' }
MorrisToken >> beOnField: aMorrisField [ 
	state := MorrisTokenOnField new field: aMorrisField.
]

{ #category : #accessing }
MorrisToken >> gtDisplayOn: stream [
	stream nextPutAll: name
]

{ #category : #accessing }
MorrisToken >> initialize [
	super initialize.
	state := #inHand
]

{ #category : #'as yet unclassified' }
MorrisToken >> isInHand [
	^ state = #inHand
]

{ #category : #'as yet unclassified' }
MorrisToken >> isOnField [
	^ state class = MorrisTokenOnField.
]

{ #category : #'as yet unclassified' }
MorrisToken >> isOnField: anInteger [
	^ state field number = anInteger.
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
MorrisToken >> state [
	^ state
]
