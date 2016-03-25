module GoogleMapsApi
  class Bounds
    JSON.mapping({
      northeast: LatLng,
      southwest: LatLng
    })
  end
end