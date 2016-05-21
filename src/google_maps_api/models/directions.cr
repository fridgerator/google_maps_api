module GoogleMapsApi
  module Directions

    # Get directions between *origin_lat*, *origin_lng* and *dest_lat*, *dest_lng*
    def self.get(
      origin_lat : String | Float64,
      origin_lng : String | Float64,
      dest_lat : String | Float64,
      dest_lng : String | Float64,
      opts = {} of Symbol => String | Int32)
      response = GoogleMapsApi::Client.get("directions", {:origin => "#{origin_lat},#{origin_lng}", :destination => "#{dest_lat},#{dest_lng}"}.merge(opts))
      Array(GoogleMapsApi::Route).from_json(response.to_s)
    end

    # Get directions between two Place's, *origin_place* and *dest_place*
    def self.get(origin_place : GooglePlace, dest_place : GooglePlace, opts = {} of Symbol => String | Int32)
      origin_lat_lng = "#{origin_place.geometry.location.lat},#{origin_place.geometry.location.lng}"
      dest_lat_lng = "#{dest_place.geometry.location.lat},#{dest_place.geometry.location.lng}"
      response = GoogleMapsApi::Client.get("directions", {:origin => origin_lat_lng , :destination => dest_lat_lng}.merge(opts))
      Array(GoogleMapsApi::Route).from_json(response.to_s)
    end
  end
end