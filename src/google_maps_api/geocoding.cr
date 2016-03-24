module GoogleMapsApi
	module Geocoding

		def self.address_search(address : String)
			response = GoogleMapsApi::Client.get("geocode", {address: address})
			Array(GoogleMapsApi::StreetAddress).from_json(response.to_s)
		end
		
	end
end