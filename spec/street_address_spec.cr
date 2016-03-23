require "./spec_helper"

describe GoogleMapsApi do
	describe "StreetAddress" do
		it "should have properties" do
			address = GoogleMapsApi::StreetAddress.new
			address.route = "route"
			address.route.should eq "route"
		end
	end	
end