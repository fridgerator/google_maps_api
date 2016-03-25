module GoogleMapsApi
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
end