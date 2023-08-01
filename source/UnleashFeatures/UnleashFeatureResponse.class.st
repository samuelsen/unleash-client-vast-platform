Class {
	#name : 'UnleashFeatureResponse',
	#superclass : 'Object',
	#instVars : [
		'features',
		'version'
	],
	#category : 'UnleashFeatures'
}

{ #category : 'Not categorized' }
UnleashFeatureResponse class >> neoJsonMapping: neoJsonReader [
	
		neoJsonReader 
			for: self 
			do: [:m | 
				m mapInstVar: #version.
				(m mapInstVar: #features) valueSchema: FeatureList].
]

{ #category : 'Accessors' }
UnleashFeatureResponse >> features [
	"Return the value of features."

	^features
]

{ #category : 'Accessors' }
UnleashFeatureResponse >> features: anOrderedCollection [
	"Save the value of features."

	features := anOrderedCollection.
	self signalEvent: #features
		 with: anOrderedCollection.
]

{ #category : 'Accessors' }
UnleashFeatureResponse >> neoJsonMapping [

	^nil
]

{ #category : 'Accessors' }
UnleashFeatureResponse >> version [
	"Return the value of version."

	^version
]

{ #category : 'Accessors' }
UnleashFeatureResponse >> version: aNumber [
	"Save the value of version."

	version := aNumber.
	self signalEvent: #version
		 with: aNumber.
]
