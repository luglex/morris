Class {
	#name : #Morris,
	#superclass : #Object,
	#instVars : [
		'playerA',
		'playerB'
	],
	#category : #Morris
}

{ #category : #accessing }
Morris >> initialize [
	super initialize.
	playerA := MorrisPlayer new name: 'A'.
	playerB := MorrisPlayer new name: 'B'.
]

{ #category : #accessing }
Morris >> playerA [
	^playerA
]

{ #category : #'as yet unclassified' }
Morris >> playerB [
	^ playerB
]

{ #category : #accessing }
Morris >> players [
	^ {playerA.playerB}
]
