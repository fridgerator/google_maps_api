require "./spec_helper"

describe GoogleMapsApi do

  describe "Geocoding" do
  	describe "#address_search" do
  		it "should return an array of StreetAddresses" do
  			GoogleMapsApi::Geocoding.address_search("1111 North 20th")
  				.should be_a(Array(GoogleMapsApi::StreetAddress))
  		end
  	end

  	describe "#latlng_search" do
  		it "should return an array of StreetAddresses" do
  			GoogleMapsApi::Geocoding.latlng_search(40.714224, -73.961452)
  				.should be_a(Array(GoogleMapsApi::StreetAddress))
  		end
  	end

  	describe "#place_search" do
  		it "should return an array of StreetAddresses" do
  			GoogleMapsApi::Geocoding.place_search("ChIJd8BlQ2BZwokRAFUEcm_qrcA")
  				.should be_a(Array(GoogleMapsApi::StreetAddress))
  		end
  	end
  end
end