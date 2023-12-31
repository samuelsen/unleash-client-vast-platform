Class {
	#name : 'UnleashClient',
	#superclass : 'Application',
	#instVars : [
		'apiKey',
		'features',
		'context',
		'baseUrl',
		'headers'
	],
	#pools : [
		'IS_'
	],
	#classInstVars : [
		'client'
	],
	#category : 'UnleashClient'
}

{ #category : 'IS_generated',
  #vaVisibility : 'private' }
UnleashClient class >> _PRAGMA_IS_ [

	"%%PRAGMA DECLARE
	(name: IS_UnleashClient isPool: true isConstant: false)
	(pool: IS_UnleashClient declarations: (
		(name: IS_apiKey isConstant: false)
		(name: IS_features isConstant: false)
		(name: IS_context isConstant: false)
		(name: IS_baseUrl isConstant: false)
		(name: IS_instanceInterfaceSpec isConstant: false)
	))"
]

{ #category : '-',
 #vaCategories : ['-','AbtEdit','AutoGen'],
  #vaVisibility : 'private' }
UnleashClient class >> abtIsViewApplication [

	^true
]

{ #category : 'IS_generated',
  #vaVisibility : 'private' }
UnleashClient class >> abtPrimFlushInterfaceSpecCache [

	IS_UnleashClient associationsDo: [: poolDictionaryAssoc | poolDictionaryAssoc value: nil].
	super abtPrimFlushInterfaceSpecCache
]

{ #category : 'IS_generated',
  #vaVisibility : 'private' }
UnleashClient class >> IS_apiKey [
	"Private - ** Warning ** This method is generated by VisualAge and should not
	be modified or deleted. This method is responsible for returning a featureSpec
	that describes the implementation of a particular feature of the receiver"

	^IS_UnleashClient::IS_apiKey notNil
		ifTrue: [IS_UnleashClient::IS_apiKey]
		ifFalse: [
		IS_UnleashClient::IS_apiKey := (AbtAttributeSpec new
		 attributeType: String;
		 setSelector: #apiKey:;
		 getSelector: #apiKey;
		 changeSymbol: #apiKey)]
]

{ #category : 'IS_generated',
  #vaVisibility : 'private' }
UnleashClient class >> IS_baseUrl [
	"Private - ** Warning ** This method is generated by VisualAge and should not
	be modified or deleted. This method is responsible for returning a featureSpec
	that describes the implementation of a particular feature of the receiver"

	^IS_UnleashClient::IS_baseUrl notNil
		ifTrue: [IS_UnleashClient::IS_baseUrl]
		ifFalse: [
		IS_UnleashClient::IS_baseUrl := (AbtAttributeSpec new
		 attributeType: String;
		 setSelector: #baseUrl:;
		 getSelector: #baseUrl;
		 changeSymbol: #baseUrl)]
]

{ #category : 'IS_generated',
  #vaVisibility : 'private' }
UnleashClient class >> IS_context [
	"Private - ** Warning ** This method is generated by VisualAge and should not
	be modified or deleted. This method is responsible for returning a featureSpec
	that describes the implementation of a particular feature of the receiver"

	^IS_UnleashClient::IS_context notNil
		ifTrue: [IS_UnleashClient::IS_context]
		ifFalse: [
		IS_UnleashClient::IS_context := (AbtAttributeSpec new
		 attributeType: UnleashContext;
		 setSelector: #context:;
		 getSelector: #context;
		 changeSymbol: #context)]
]

{ #category : 'IS_generated',
  #vaVisibility : 'private' }
UnleashClient class >> IS_features [
	"Private - ** Warning ** This method is generated by VisualAge and should not
	be modified or deleted. This method is responsible for returning a featureSpec
	that describes the implementation of a particular feature of the receiver"

	^IS_UnleashClient::IS_features notNil
		ifTrue: [IS_UnleashClient::IS_features]
		ifFalse: [
		IS_UnleashClient::IS_features := (AbtAttributeSpec new
		 attributeType: OrderedCollection;
		 setSelector: #features:;
		 getSelector: #features;
		 changeSymbol: #features)]
]

{ #category : 'IS_generated',
  #vaVisibility : 'private' }
UnleashClient class >> IS_instanceInterfaceSpec [
	"Private - ** Warning ** This method is generated by VisualAge and should not
	be modified or deleted. This method is responsible for returning a featureSpec
	that describes the implementation of a particular feature of the receiver"

	^IS_UnleashClient::IS_instanceInterfaceSpec notNil
		ifTrue: [IS_UnleashClient::IS_instanceInterfaceSpec]
		ifFalse: [
		IS_UnleashClient::IS_instanceInterfaceSpec := AbtInterfaceSpec new
		featureNamed: #apiKey put: self IS_apiKey;
		featureNamed: #features put: self IS_features;
		featureNamed: #context put: self IS_context;
		featureNamed: #baseUrl put: self IS_baseUrl]
]

{ #category : '-',
 #vaCategories : ['-','AbtEdit','AutoGen'] }
UnleashClient class >> new [

	client ifNil: [client := self basicNew].
	^client.
]

{ #category : 'Accessors' }
UnleashClient >> apiKey [
	"Return the value of apiKey."

	^apiKey
]

{ #category : 'Accessors' }
UnleashClient >> apiKey: aString [
	"Save the value of apiKey."

	apiKey := aString.
	
	self headersAddKey: 'Authorization' value: aString. 
	
	self signalEvent: #apiKey
		 with: aString.
]

{ #category : 'Accessors' }
UnleashClient >> baseUrl [
	"Return the value of baseUrl."

	^baseUrl
]

{ #category : 'Accessors' }
UnleashClient >> baseUrl: aString [
	"Save the value of baseUrl."

	baseUrl := aString.
	self signalEvent: #baseUrl
		 with: aString.
]

{ #category : 'Accessors' }
UnleashClient >> context [
	"Return the value of context."

	^context
]

{ #category : 'Accessors' }
UnleashClient >> context: anUnleashContext [
	"Save the value of context."

	context := anUnleashContext.
	self signalEvent: #context
		 with: anUnleashContext.
]

{ #category : 'urlPaths' }
UnleashClient >> featurePath [

	^'/features'
]

{ #category : 'Accessors' }
UnleashClient >> features [
	"Return the value of features."

	^features
]

{ #category : 'Accessors' }
UnleashClient >> features: anOrderedCollection [
	"Save the value of features."

	features := anOrderedCollection.
	self signalEvent: #features
		 with: anOrderedCollection.
]

{ #category : 'UnleashOperations' }
UnleashClient >> fetchFeatures [

|  url client2 response |

	url := (self baseUrl, self featurePath) sstAsUrl.
	(client2 := SstHttpClient forTransportScheme: url localEndpointUrl transport) startUp.
	response := [client2 get: url using: nil  withHeaders: headers] ensure: [client2 shutDown].
	self features: (NeoJSONReader fromString: (response contents asString) as: UnleashFeatureResponse).
	
	^self features.
]

{ #category : 'Accessors' }
UnleashClient >> headers [

	^headers
]

{ #category : 'Accessors' }
UnleashClient >> headersAddKey: key value: value [

	self headers ifNil: [headers := Dictionary new initialize].
	self headers at: key put: value. 
]

{ #category : 'Accessors' }
UnleashClient >> initialize [
	
	super initialize.
	self headersAddKey:  'UNLEASH-APPNAME' value: 'Smalltalk'.
	self headersAddKey:  'UNLEASH-INSTANCEID' value: 'VAST2021'.
]

{ #category : 'urlPaths' }
UnleashClient >> metricPath [

	^'/metrics'
]
