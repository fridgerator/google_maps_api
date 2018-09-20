require "./spec_helper"

describe GoogleMapsApi::Place do
  describe "#nearby" do
    context "with lat lng" do
      response = File.read("#{Dir.current}/spec/fixtures/places.json")

      Spec.before_each do
        WebMock.stub(:get, "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.714224%2C-73.961452&radius=1000")
               .to_return(response)
      end

      it "should throw an error without a radius" do
        expect_raises(Exception) { GoogleMapsApi::Place.nearby(40.714224, -73.961452) }
      end

      it "should return an array of StreetAddresses" do
        GoogleMapsApi::Place.nearby(40.714224, -73.961452, {:radius => 1000})
          .class.should eq Array(GoogleMapsApi::GooglePlace)
      end
    end

    context "with a place" do
      response = File.read("#{Dir.current}/spec/fixtures/places.json")

      Spec.before_each do
        WebMock.stub(:get, "https://maps.googleapis.com/maps/api/place/details/json?placeid=ChIJQSrBBv1bwokRbNfFHCnyeYI")
               .to_return(Fixture.load("place.json"))
               WebMock.stub(:get, "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.708115%2C-73.95707&radius=1000")
               .to_return(response)
      end

      it "should return an array of Street Addresses" do
        place = GoogleMapsApi::Place.details("ChIJQSrBBv1bwokRbNfFHCnyeYI")
        GoogleMapsApi::Place.nearby(place, {:radius => 1000})
          .class.should eq Array(GoogleMapsApi::GooglePlace)
      end
    end
  end

  describe "#details" do
  response = File.read("#{Dir.current}/spec/fixtures/place.json")

    Spec.before_each do
      WebMock.stub(:get, "https://maps.googleapis.com/maps/api/place/details/json?placeid=ChIJQSrBBv1bwokRbNfFHCnyeYI")
             .to_return(response)
    end

    it "should return a single google place" do
      GoogleMapsApi::Place.details("ChIJQSrBBv1bwokRbNfFHCnyeYI")
        .class.should eq GoogleMapsApi::GooglePlace
    end
  end
end
