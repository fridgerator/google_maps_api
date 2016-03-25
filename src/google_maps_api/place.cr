module GoogleMapsApi
  module Place

    def self.nearby(lat : String | Float64, lng : String | Float64, opts = {} of Symbol => String | Int32)
      raise Exception.new("Must provide radius or rankby in options") if (!opts[:radius]? && !opts[:rankby]?)

      response = GoogleMapsApi::Client.get("place/nearbysearch", {location: "#{lat},#{lng}"}.merge(opts))
      Array(GoogleMapsApi::GooglePlace).from_json(response.to_s)
    end

    def self.details(place_id : String, opts = {} of Symbol => String | Int32)
      response = GoogleMapsApi::Client.get("place/details", {placeid: place_id})
      GoogleMapsApi::GooglePlace.from_json(response.to_s)
    end
  end
end