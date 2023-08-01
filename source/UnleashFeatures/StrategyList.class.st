Class {
	#name : 'StrategyList',
	#superclass : 'Object',
	#category : 'UnleashFeatures'
}

{ #category : 'Not categorized' }
StrategyList class >> neoJsonMapping: neoJsonReader [
	
		neoJsonReader 
			for: self 
			customDo: [ :mapping |
				mapping listOfElementSchema: Strategy ].
]

{ #category : 'Not categorized' }
StrategyList >> neoJsonMapping: neoJsonReader [
	
		neoJsonReader 
			for: self 
			customDo: [ :mapping |
				mapping listOfElementSchema: Strategy ].
]
