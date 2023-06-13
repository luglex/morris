Class {
	#name : #MorrisField,
	#superclass : #Object,
	#instVars : [
		'number',
		'coordinate',
		'connectedFields'
	],
	#category : #Morris
}

{ #category : #accessing }
MorrisField >> connectedFields [
	^ connectedFields
]

{ #category : #'as yet unclassified' }
MorrisField >> connectedFields: aCollection [ 
	connectedFields := aCollection
]

{ #category : #accessing }
MorrisField >> coordinate [
	^ coordinate
]

{ #category : #accessing }
MorrisField >> coordinate: aPoint [
	coordinate := aPoint
]

{ #category : #accessing }
MorrisField >> gtConnectedFieldsFor: aView [ 
	<gtView>
	^ aView list 
		title: 'Connected fields';
		items: [ connectedFields ]
]

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
MorrisField >> number: aNumber [
	number := aNumber.
]
