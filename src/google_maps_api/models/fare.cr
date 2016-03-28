module GoogleMapsApi
  class Fare
    JSON.mapping({
      currency: String,
      value: Int32,
      text: String  
    })
  end
end