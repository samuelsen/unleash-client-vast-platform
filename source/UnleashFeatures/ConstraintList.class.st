Class {
	#name : 'ConstraintList',
	#superclass : 'Object',
	#category : 'UnleashFeatures'
}

{ #category : 'Not categorized' }
ConstraintList class >> neoJsonMapping: neoJsonReader [
	
		neoJsonReader 
			for: self 
			customDo: [ :mapping |
				mapping listOfElementSchema: Constraint ].
]
