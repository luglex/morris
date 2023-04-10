Class {
	#name : #MorrisToken,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #Morris
}

{ #category : #accessing }
MorrisToken >> gtDisplayOn: stream [
	stream nextPutAll: name
]

{ #category : #accessing }
MorrisToken >> name: aString [ 
	name := aString
]
