module GoogleMapsApi
	class LatLng
		JSON.mapping({
			lat: Float32,
			lng: Float32	
		})
	end

	class Bounds
		JSON.mapping({
			northeast: LatLng,
			southwest: LatLng
		})
	end

	class Geometry
		JSON.mapping({
			bounds: {type: Bounds, nilable: true},
			location: LatLng,
			location_type: String,
			viewport: Bounds
		})
	end

	class AddressComponent
		JSON.mapping({
			long_name: String,
			short_name: String,
			types: Array(String)	
		})

		def type
			types[0]
		end
	end

	class StreetAddress
		JSON.mapping({
			address_components: Array(AddressComponent),
			formatted_address: String,
			geometry: Geometry,
			place_id: String,
			types: Array(String)
		})
	end
end