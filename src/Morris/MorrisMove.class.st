Class {
	#name : #MorrisMove,
	#superclass : #Object,
	#instVars : [
		'token',
		'fromField',
		'toField',
		'hasMorris',
		'captured',
		'isGameOver'
	],
	#category : #Morris
}

{ #category : #accessing }
MorrisMove >> captured [
	^ captured
]

{ #category : #'as yet unclassified' }
MorrisMove >> captured: aMorrisToken [ 
	captured := aMorrisToken
]

{ #category : #accessing }
MorrisMove >> fromField [
	^ fromField
]

{ #category : #accessing }
MorrisMove >> fromField: aField [ 
	fromField := aField
]

{ #category : #accessing }
MorrisMove >> hasMorris [
	^ hasMorris
]

{ #category : #'as yet unclassified' }
MorrisMove >> hasMorris: aBoolean [ 
	hasMorris := aBoolean
]

{ #category : #accessing }
MorrisMove >> initialize [
	isGameOver := false.
]

{ #category : #accessing }
MorrisMove >> isFinished [
	^ hasMorris not or: [hasMorris and: [ captured notNil ] ]
]

{ #category : #accessing }
MorrisMove >> isGameOver [
	^ isGameOver
]

{ #category : #'as yet unclassified' }
MorrisMove >> isGameOver: aBoolean [ 
	isGameOver := aBoolean
]

{ #category : #accessing }
MorrisMove >> player [
	^ token player
]

{ #category : #accessing }
MorrisMove >> toField [
	^ toField
]

{ #category : #accessing }
MorrisMove >> toField: aField [ 
	toField := aField
]

{ #category : #accessing }
MorrisMove >> token [ 
	^ token
]

{ #category : #accessing }
MorrisMove >> token: aToken [ 
	token := aToken
]
