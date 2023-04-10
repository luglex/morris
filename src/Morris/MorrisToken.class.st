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

{ #category : #'as yet unclassified' }
MorrisToken >> name [
	^ name
]

{ #category : #accessing }
MorrisToken >> name: aString [ 
	name := aString
]
