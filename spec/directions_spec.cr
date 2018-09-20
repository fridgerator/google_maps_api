require "./spec_helper"

describe GoogleMapsApi::Directions do
  response = File.read("#{Dir.current}/spec/fixtures/directions.json")

  Spec.before_each do
    WebMock.stub(:get, "https://maps.googleapis.com/maps/api/directions/json?origin=39.6684948%2C-79.6375071&destination=40.4313473%2C-80.0505404")
           .to_return(response)
  end

  describe "#get" do
    context "with two latitude and longitudes" do
      it "should return an array of Routes" do
        GoogleMapsApi::Directions.get(39.6684948, -79.6375071, 40.4313473, -80.0505404)
          .class.should eq Array(GoogleMapsApi::Route)
      end
    end

    context "with two places" do
      Spec.before_each do
        place_response = File.read("#{Dir.current}/spec/fixtures/place.json")
        WebMock.stub(:get, "https://maps.googleapis.com/maps/api/place/details/json?placeid=ChIJQSrBBv1bwokRbNfFHCnyeYI")
               .to_return(place_response)
               WebMock.stub(:get, "https://maps.googleapis.com/maps/api/directions/json?origin=40.708115%2C-73.95707&destination=40.708115%2C-73.95707")
               .to_return(response)
      end

      it "should return an array of Routes" do
        origin_place = GoogleMapsApi::Place.details("ChIJQSrBBv1bwokRbNfFHCnyeYI")
        dest_place = GoogleMapsApi::Place.details("ChIJQSrBBv1bwokRbNfFHCnyeYI")
        GoogleMapsApi::Directions.get(origin_place, dest_place)
          .class.should eq Array(GoogleMapsApi::Route)
      end
    end
  end
end
