Class {
	#name : 'FeatureList',
	#superclass : 'Object',
	#category : 'UnleashFeatures'
}

{ #category : 'Not categorized' }
FeatureList class >> neoJsonMapping: neoJsonReader [
	
		neoJsonReader 
			for: self 
			customDo: [ :mapping |
				mapping listOfElementSchema: Feature ].
]
