module GoogleMapsApi
  class StreetAddress
    JSON.mapping({
      address_components: Array(AddressComponent),
      formatted_address: String,
      geometry: Geometry,
      place_id: String,
      types: Array(String)
    })
  end
end