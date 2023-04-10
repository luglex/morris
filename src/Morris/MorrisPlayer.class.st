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
MorrisPlayer >> gtTokensFor: aView [
	<gtView>
	^aView list
	title: 'Tokens';
	items: [tokens]
]

{ #category : #accessing }
MorrisPlayer >> initialize [
	super initialize.
	tokens := (1 to: 9) collect: [ :i | MorrisToken new  ]
]

{ #category : #accessing }
MorrisPlayer >> name: aString [ 
	name := aString.
	tokens withIndexDo: [:each :i | each name: name, i asString ]
]

{ #category : #'as yet unclassified' }
MorrisPlayer >> tokens [
	^ tokens
]
