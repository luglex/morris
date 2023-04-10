Class {
	#name : #MorrisPlayer,
	#superclass : #Object,
	#instVars : [
		'name',
		'tokens'
	],
	#category : #Morris
}

{ #category : #accessing }
MorrisPlayer >> initialize [
	super initialize.
	tokens := 
	(1 to: 9 ) collect: [ :each |MorrisToken new name: each].
]

{ #category : #accessing }
MorrisPlayer >> name: aString [ 
	name := aString
]
