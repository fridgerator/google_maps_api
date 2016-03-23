require "http/client"
require "http/params"
require "./google_maps_api/*"

module GoogleMapsApi
  # TODO Put your code here
  API_KEY = ""

  def self.append_key(url : String)
  	unless API_KEY.empty?
  		url = url + "key=#{API_KEY}"
  	end

	url
  end
end
