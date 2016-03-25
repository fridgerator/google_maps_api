require "./spec_helper"

describe GoogleMapsApi::Geocoding do

  let(response) { Fixture.load("addresses.json").to_s }

  describe "#address_search" do
    before do
      WebMock.stub(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=1111+North+20th")
        .to_return(response)
    end

    it "should return an array of StreetAddresses" do
      expect(GoogleMapsApi::Geocoding.address_search("1111 North 20th"))
        .to be_a(Array(GoogleMapsApi::StreetAddress))
    end
  end

  describe "#latlng_search" do
    before do
      WebMock.stub(:get, "maps.googleapis.com/maps/api/geocode/json?latlng=40.7142%2C-73.9615")
        .to_return(response)
    end

    it "should return an array of StreetAddresses" do
      expect(GoogleMapsApi::Geocoding.latlng_search(40.714224, -73.961452))
        .to be_a(Array(GoogleMapsApi::StreetAddress))
    end
  end

  describe "#place_search" do
    before do
      WebMock.stub(:get, "maps.googleapis.com/maps/api/geocode/json?place_id=ChIJd8BlQ2BZwokRAFUEcm_qrcA")
        .to_return(response)
    end
    it "should return an array of StreetAddresses" do
      expect(GoogleMapsApi::Geocoding.place_search("ChIJd8BlQ2BZwokRAFUEcm_qrcA"))
        .to be_a(Array(GoogleMapsApi::StreetAddress))
    end
  end
end