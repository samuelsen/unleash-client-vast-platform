Class {
	#name : 'Constraint',
	#superclass : 'Object',
	#instVars : [
		'operator',
		'caseInsensitive',
		'contextName',
		'inverted',
		'values'
	],
	#category : 'UnleashFeatures'
}

{ #category : 'Not categorized' }
Constraint class >> neoJsonMapping: neoJsonReader [
	
		^neoJsonReader 
			for: self 
			do: [:m |
				 m mapInstVars: self instVarNames.]
]

{ #category : 'Accessors' }
Constraint >> caseInsensitive [
	"Return the value of caseInsensitive."

	^caseInsensitive
]

{ #category : 'Accessors' }
Constraint >> caseInsensitive: aBoolean [
	"Save the value of caseInsensitive."

	caseInsensitive := aBoolean.
	self signalEvent: #caseInsensitive
		 with: aBoolean.
]

{ #category : 'Accessors' }
Constraint >> contextName [
	"Return the value of contextName."

	^contextName
]

{ #category : 'Accessors' }
Constraint >> contextName: aString [
	"Save the value of contextName."

	contextName := aString.
	self signalEvent: #contextName
		 with: aString.
]

{ #category : 'Accessors' }
Constraint >> inverted [
	"Return the value of inverted."

	^inverted
]

{ #category : 'Accessors' }
Constraint >> inverted: aBoolean [
	"Save the value of inverted."

	inverted := aBoolean.
	self signalEvent: #inverted
		 with: aBoolean.
]

{ #category : 'Accessors' }
Constraint >> operator [
	"Return the value of operator."

	^operator
]

{ #category : 'Accessors' }
Constraint >> operator: aString [
	"Save the value of operator."

	operator := aString.
	self signalEvent: #operator
		 with: aString.
]

{ #category : 'Accessors' }
Constraint >> values [
	"Return the value of values."

	^values
]

{ #category : 'Accessors' }
Constraint >> values: aDictionary [
	"Save the value of values."

	values := aDictionary.
	self signalEvent: #values
		 with: aDictionary.
]
