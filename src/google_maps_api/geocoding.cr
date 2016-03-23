module GoogleMapsApi
	module Geocoding
		BASE_URL = "https://maps.googleapis.com/maps/api/geocode/json?"

		def self.address_search(address : String)
			url = GoogleMapsApi.append_key "#{BASE_URL}address=#{HTTP::Params.parse(address)}"
			response = HTTP::Client.get url
			response.body
		end
	end
end