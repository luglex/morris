Class {
	#name : #BaselineOfMorris,
	#superclass : #BaselineOf,
	#category : #BaselineOfMorris
}

{ #category : #baseline }
BaselineOfMorris >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'Morris'
		]
]
