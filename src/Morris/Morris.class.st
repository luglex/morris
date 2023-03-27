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
