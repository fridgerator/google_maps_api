module GoogleMapsApi
  module Geocoding

    # Performs an address search with the specified *address*, returns an Array of StreetAddresses
    def self.address_search(address : String, opts = {} of Symbol => String)
      response = GoogleMapsApi::Client.get("geocode", {:address => address}.merge(opts))
      Array(GoogleMapsApi::StreetAddress).from_json(response.to_s)
    end

    # Performs a latlng serach with the passed *lat* and *lng*, returns an Array of StreetAddresses
    def self.latlng_search(lat : String | Float64, lng : String | Float64, opts = {} of Symbol => String)
      response = GoogleMapsApi::Client.get("geocode", {:latlng => "#{lat},#{lng}"}.merge(opts))
      Array(GoogleMapsApi::StreetAddress).from_json(response.to_s)
    end

    # Performs a place search with the specified *place_id*, returns an Array of StreetAddresses
    def self.place_search(place_id : String, opts = {} of Symbol => String)
      response = GoogleMapsApi::Client.get("geocode", {:place_id => place_id}.merge(opts))
      Array(GoogleMapsApi::StreetAddress).from_json(response.to_s)
    end
  end
end