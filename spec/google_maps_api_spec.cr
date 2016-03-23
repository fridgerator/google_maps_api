require "./spec_helper"

describe GoogleMapsApi do
  # TODO: Write tests

  describe "Geocoding" do
  	describe "#address_search" do
  		it "should return something" do
  			GoogleMapsApi::Geocoding.address_search("1911 South 26th").should be_a(String)
  		end
  	end
  end
end
