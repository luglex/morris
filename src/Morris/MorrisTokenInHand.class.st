Class {
	#name : #MorrisTokenInHand,
	#superclass : #MorrisState,
	#category : #Morris
}

{ #category : #accessing }
MorrisTokenInHand >> canPlayOnField: aField from: aMorris [
	^ (aMorris fieldHasToken: aField) not
]

{ #category : #accessing }
MorrisTokenInHand >> gtDisplayOn: stream [
	stream
		nextPutAll: 'In Hand'
]
