Class {
	#name : #MorrisTokenOnField,
	#superclass : #MorrisState,
	#instVars : [
		'field'
	],
	#category : #Morris
}

{ #category : #accessing }
MorrisTokenOnField >> canPlayOnField: aField from: aMorris [
	^ (aMorris fieldHasToken: aField) not
		and: [ self field connectedFields includes: aField ]
]

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
