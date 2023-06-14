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
	tokens := (1 to: 9) collect: [ :i | MorrisToken new player: self ]
]

{ #category : #accessing }
MorrisPlayer >> name: aString [ 
	name := aString.
	tokens withIndexDo: [:each :i | each name: name, i asString ]
]

{ #category : #'as yet unclassified' }
MorrisPlayer >> numberOfTokensCaptured [
	^ (tokens select: #isCaptured) size
]

{ #category : #'as yet unclassified' }
MorrisPlayer >> second [
	self shouldBeImplemented.
]

{ #category : #accessing }
MorrisPlayer >> token1 [
	^ tokens at: 1
]

{ #category : #accessing }
MorrisPlayer >> token2 [
	^ tokens at: 2
]

{ #category : #accessing }
MorrisPlayer >> token3 [
	^ tokens at: 3
]

{ #category : #accessing }
MorrisPlayer >> token4 [
	^ tokens at: 4
]

{ #category : #accessing }
MorrisPlayer >> token5 [
	^ tokens at: 5
]

{ #category : #accessing }
MorrisPlayer >> token6 [
	^ tokens at: 6
]

{ #category : #accessing }
MorrisPlayer >> token7 [
	^ tokens at: 7
]

{ #category : #accessing }
MorrisPlayer >> token8 [
	^ tokens at: 8
]

{ #category : #accessing }
MorrisPlayer >> token9 [
	^ tokens at: 9
]

{ #category : #'as yet unclassified' }
MorrisPlayer >> tokens [
	^ tokens
]
