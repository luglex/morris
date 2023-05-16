Class {
	#name : #MorrisTokenOnField,
	#superclass : #Object,
	#instVars : [
		'field'
	],
	#category : #Morris
}

{ #category : #accessing }
MorrisTokenOnField >> field [
	^ field
]

{ #category : #accessing }
MorrisTokenOnField >> field: aMorrisField [
	field := aMorrisField
]

{ #category : #accessing }
MorrisTokenOnField >> gtDisplayOn: stream [
	stream
		nextPutAll: 'On '.
	field gtDisplayOn: stream.
]
