Class {
	#name : #MorrisField,
	#superclass : #Object,
	#instVars : [
		'number'
	],
	#category : #Morris
}

{ #category : #accessing }
MorrisField >> gtDisplayOn: stream [
	stream
		nextPutAll: 'Field ';
		nextPutAll: number asString.
]

{ #category : #accessing }
MorrisField >> name: i [ 
]

{ #category : #'as yet unclassified' }
MorrisField >> number [
	^ number
]

{ #category : #accessing }
MorrisField >> number: i [
	number := i.
]
