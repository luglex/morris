Class {
	#name : #MorrisToken,
	#superclass : #Object,
	#instVars : [
		'name',
		'state'
	],
	#category : #Morris
}

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
MorrisToken >> name [
	^ name
]

{ #category : #accessing }
MorrisToken >> name: aString [ 
	name := aString
]
