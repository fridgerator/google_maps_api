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
			vicinity: String,
			address_components: {type: Array(AddressComponent), nilable: true},
			formatted_address: {type: String, nilable: true},
			formatted_phone_number: {type: String, nilable: true},
			international_phone_number: {type: String, nilable: true},
			rating: {type: Float64, nilable: true},
			reviews: {type: Array(Review), nilable: true},
			website: {type: String, nilable: true},
			price_level: {type: Int32, nilable: true}
		})
	end
end