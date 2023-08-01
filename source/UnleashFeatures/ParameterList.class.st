Class {
	#name : 'ParameterList',
	#superclass : 'Object',
	#category : 'UnleashFeatures'
}

{ #category : 'Not categorized' }
ParameterList class >> neoJsonMapping: neoJsonReader [
	
		neoJsonReader 
			for: self 
			customDo: [ :mapping |
				mapping listOfElementSchema: Parameter ].
]
