module GoogleMapsApi
  class Route
    JSON.mapping({
      bounds: Bounds,
      copyrights: String,
      legs: Array(Leg),
      overview_polyline: Hash(String, String),
      summary: String,
      warnings: Array(String),
      waypoint_order: Array(Int32),
      fare: {type: Fare, nilable: true}
    })
  end
end