require "./spec_helper"

describe GoogleMapsApi do

  describe "Geocoding" do
  	describe "#address_search" do
  		it "should return an array of StreetAddresses" do
  			GoogleMapsApi::Geocoding.address_search("1111 North 20th").should be_a(Array(GoogleMapsApi::StreetAddress))
  		end
  	end
  end
end
