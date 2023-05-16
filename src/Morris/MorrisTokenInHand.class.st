Class {
	#name : #MorrisTokenInHand,
	#superclass : #Object,
	#category : #Morris
}

{ #category : #accessing }
MorrisTokenInHand >> gtDisplayOn: stream [
	stream
		nextPutAll: 'In Hand'
]
