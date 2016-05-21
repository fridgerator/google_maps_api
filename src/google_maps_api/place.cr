module GoogleMapsApi
  module Place

    # Query for Places nearby the passed *latitude* and *longitude*.
    # This endpoint requires either radius or rankby which should be added to the opts
    # 
    # ```crystal
    # GoogleMapsApi::Place.nearby(40.714224, -73.961452, {radius: 1000})
    # ```
    def self.nearby(lat : String | Float64, lng : String | Float64, opts = {} of Symbol => String | Int32)
      raise Exception.new("Must provide radius or rankby in options") if (!opts[:radius]? && !opts[:rankby]?)

      response = GoogleMapsApi::Client.get("place/nearbysearch", {:location => "#{lat},#{lng}"}.merge(opts))
      Array(GoogleMapsApi::GooglePlace).from_json(response.to_s)
    end

    # Query near another *place*
    def self.nearby(place : GooglePlace, opts = {} of Symbol => String | Int32)
      raise Exception.new("Must provide radius or rankby in options") if (!opts[:radius]? && !opts[:rankby]?)

      response = GoogleMapsApi::Client.get(
        "place/nearbysearch",
        {:location => "#{place.geometry.location.lat},#{place.geometry.location.lng}"
      }.merge(opts))
      Array(GoogleMapsApi::GooglePlace).from_json(response.to_s)
    end

    # Query for the details of a Place by *place_id*
    def self.details(place_id : String, opts = {} of Symbol => String | Int32)
      response = GoogleMapsApi::Client.get("place/details", {:placeid => place_id}.merge(opts))
      GoogleMapsApi::GooglePlace.from_json(response.to_s)
    end
  end
end