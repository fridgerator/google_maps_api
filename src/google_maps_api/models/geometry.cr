module GoogleMapsApi
  class Geometry
    JSON.mapping({
      bounds: {type: Bounds, nilable: true},
      location: LatLng,
      location_type: {type: String, nilable: true},
      viewport: {type: Bounds, nilable: true}
    })
  end
end