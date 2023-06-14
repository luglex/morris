Class {
	#name : #BaselineOfMorris,
	#superclass : #BaselineOf,
	#category : #BaselineOfMorris
}

{ #category : #accessing }
BaselineOfMorris class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'morris' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfMorris >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'Morris'
		]
]
