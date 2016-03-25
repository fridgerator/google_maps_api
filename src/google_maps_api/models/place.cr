module GoogleMapsApi
	class GooglePlace
		JSON.mapping({
			geometry: Geometry,
			icon: String,
			id: String,
			name: String,
			opening_hours: {type: Hash(String, JSON::Any), nilable: true},
			photos: {type: Array(Photo), nilable: true},
			place_id: String,
			scope: String,
			alt_ids: {type: AltId, nilable: true},
			reference: String,
			types: Array(String),
			vicinity: String
		})
	end
end