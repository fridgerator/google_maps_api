require "./spec_helper"

describe GoogleMapsApi do
	describe "Place" do
		describe "#nearby" do
			it "should throw an error without a radius" do
				expect_raises(Exception) {GoogleMapsApi::Place.nearby(40.714224, -73.961452)}
			end

			it "should throw an error without an api key" do
				expect_raises(GoogleMapsApi::Errors::ClientError) { GoogleMapsApi::Place.nearby(40.714224, -73.961452, {radius: 1000}) }
			end

			it "should return an array of StreetAddresses" do
				# how to set env variable???
				GoogleMapsApi::Place.nearby(40.714224, -73.961452, {radius: 1000})
					.should be_a(Array(GoogleMapsApi::GooglePlace))
			end
		end

		describe "#details" do 
			it "should return a single google place" do
				GoogleMapsApi::Place.details("ChIJQSrBBv1bwokRbNfFHCnyeYI").should be_a(GoogleMapsApi::GooglePlace)
			end
		end
	end
end