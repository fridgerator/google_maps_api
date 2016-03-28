module GoogleMapsApi
  class Leg
    JSON.mapping({
      distance: Distance,
      duration: Duration,
      end_address: String,
      end_location: LatLng,
      start_address: String,
      start_location: LatLng,
      steps: Array(Step),
      via_waypoint: Array(JSON::Any)
    })
  end
end