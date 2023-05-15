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
