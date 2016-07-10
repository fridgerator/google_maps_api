require "./spec_helper"

describe GoogleMapsApi::Place do
  describe "#nearby" do
    context "with lat lng" do
      let(response) { Fixture.load("places.json") }

      before do
        WebMock.stub(:get, "maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.714224%2C-73.961452&radius=1000")
          .to_return(response)
      end

      it "should throw an error without a radius" do
        expect_raises(Exception) {GoogleMapsApi::Place.nearby(40.714224, -73.961452)}
      end

      it "should return an array of StreetAddresses" do
        expect(GoogleMapsApi::Place.nearby(40.714224, -73.961452, {:radius => 1000}))
          .to be_a(Array(GoogleMapsApi::GooglePlace))
      end
    end

    context "with a place" do
      let (response) { Fixture.load("places.json") }

      before do
        WebMock.stub(:get, "maps.googleapis.com/maps/api/place/details/json?placeid=ChIJQSrBBv1bwokRbNfFHCnyeYI")
          .to_return(Fixture.load("place.json"))
        WebMock.stub(:get, "maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.7081%2C-73.9571&radius=1000")
          .to_return(response)
      end

      it "should return an array of Street Addresses" do
        place = GoogleMapsApi::Place.details("ChIJQSrBBv1bwokRbNfFHCnyeYI")
        expect(GoogleMapsApi::Place.nearby(place, {:radius => 1000}))
          .to be_a(Array(GoogleMapsApi::GooglePlace))
      end
    end
  end

  describe "#details" do
    let(response) { Fixture.load("place.json") }

    before do
      WebMock.stub(:get, "maps.googleapis.com/maps/api/place/details/json?placeid=ChIJQSrBBv1bwokRbNfFHCnyeYI")
        .to_return(response)
    end

    it "should return a single google place" do
      expect(GoogleMapsApi::Place.details("ChIJQSrBBv1bwokRbNfFHCnyeYI")).to be_a(GoogleMapsApi::GooglePlace)
    end
  end
end