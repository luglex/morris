Class {
	#name : #MorrisState,
	#superclass : #Object,
	#category : #Morris
}

{ #category : #accessing }
MorrisState >> canPlayOnField: aField from: aMorris [
	self subclassResponsibility
]
