module GoogleMapsApi
  class Review
    JSON.mapping({
      aspects: Array(Aspect),
      author_name: String,
      autor_url: String,
      language: String,
      rating: Int32,
      text: String,
      time: {type: Time, converter: Time::Format.new("%a %b %d %T +0000 %Y")}
    })
  end
end