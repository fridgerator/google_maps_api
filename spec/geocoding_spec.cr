require "./spec_helper"

describe GoogleMapsApi::Geocoding do
  response = File.read("#{Dir.current}/spec/fixtures/addresses.json")

  describe "#address_search" do
    Spec.before_each do
      WebMock.stub(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=1111+North+20th")
             .to_return(response)
    end

    it "should return an array of StreetAddresses" do
      GoogleMapsApi::Geocoding.address_search("1111 North 20th")
        .class.should eq Array(GoogleMapsApi::StreetAddress)
    end
  end

  describe "#latlng_search" do
    Spec.before_each do
      WebMock.stub(:get, "https://maps.googleapis.com/maps/api/geocode/json?latlng=40.714224%2C-73.961452")
             .to_return(response)
    end

    it "should return an array of StreetAddresses" do
      GoogleMapsApi::Geocoding.latlng_search(40.714224, -73.961452)
        .class.should eq Array(GoogleMapsApi::StreetAddress)
    end
  end

  describe "#place_search" do
    Spec.before_each do
      WebMock.stub(:get, "https://maps.googleapis.com/maps/api/geocode/json?place_id=ChIJd8BlQ2BZwokRAFUEcm_qrcA")
             .to_return(response)
    end
    it "should return an array of StreetAddresses" do
      GoogleMapsApi::Geocoding.place_search("ChIJd8BlQ2BZwokRAFUEcm_qrcA")
        .class.should eq Array(GoogleMapsApi::StreetAddress)
    end
  end
end
