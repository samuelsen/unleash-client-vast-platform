Package {
	#name : 'UnleashClient',
	#vaPrerequisites : ['AbtViewApplication','NeoJSONVASTCoreApp','SstHttpsCommunications'],
	#vaSubApplications : [
	{
		#condition : 'true',
		#subapps : [
			'UnleashFeatures',
			'UnleashMetrics',
			'UnleashRegister'
		]
	}
]
}
