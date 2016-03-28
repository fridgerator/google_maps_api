module GoogleMapsApi
  class Step
    JSON.mapping({
      distance: Distance,
      duration: Duration,
      end_location: LatLng,
      html_instructions: String,
      polyline: Hash(String, String),
      start_location: LatLng,
      travel_mode: String,
      maneuver: {type: String, nilable: true}
    })
  end
end