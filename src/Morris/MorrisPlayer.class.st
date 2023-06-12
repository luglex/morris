Class {
	#name : #MorrisPlayer,
	#superclass : #Object,
	#instVars : [
		'name',
		'tokens',
		'color'
	],
	#category : #Morris
}

{ #category : #accessing }
MorrisPlayer >> color [
	^ color
]

{ #category : #accessing }
MorrisPlayer >> color: aColor [
	color := aColor
]

{ #category : #accessing }
MorrisPlayer >> gtTokensFor: aView [
	<gtView>
	^aView columnedList
		title: 'Tokens';
		items: [tokens];
		column: 'Field' text: #gtDisplayString;
		column: 'State' text: [:token | token state gtDisplayString ]
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
MorrisPlayer >> second [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
MorrisPlayer >> tokens [
	^ tokens
]
