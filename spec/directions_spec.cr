require "./spec_helper"

describe GoogleMapsApi::Directions do

  let(response) { Fixture.load("directions.json").to_s }

  before do
    WebMock.stub(:get, "maps.googleapis.com/maps/api/directions/json?origin=39.6685%2C-79.6375&destination=40.4313%2C-80.0505")
      .to_return(response)
  end

  describe "#get" do
    context "with two latitude and longitudes" do
      it "should return an array of Routes" do
        expect(GoogleMapsApi::Directions.get(39.6684948, -79.6375071, 40.4313473, -80.0505404))
          .to be_a(Array(GoogleMapsApi::Route))
      end
    end

    context "with two places" do
      before do
        WebMock.stub(:get, "maps.googleapis.com/maps/api/place/details/json?placeid=ChIJQSrBBv1bwokRbNfFHCnyeYI")
          .to_return(Fixture.load("place.json"))
        WebMock.stub(:get, "maps.googleapis.com/maps/api/directions/json?origin=40.7081%2C-73.9571&destination=40.7081%2C-73.9571")
          .to_return(response)
      end

      it "should return an array of Routes" do
        origin_place = GoogleMapsApi::Place.details("ChIJQSrBBv1bwokRbNfFHCnyeYI")
        dest_place = GoogleMapsApi::Place.details("ChIJQSrBBv1bwokRbNfFHCnyeYI")
        expect(GoogleMapsApi::Directions.get(origin_place, dest_place))
          .to be_a(Array(GoogleMapsApi::Route))
      end
    end
  end
end