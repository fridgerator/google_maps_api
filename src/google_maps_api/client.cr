module GoogleMapsApi
  class Client
    BASE_URL = "https://maps.googleapis.com/maps/api/"
    API_KEY = ENV["GOOGLE_API_KEY"]? ? ENV["GOOGLE_API_KEY"] : ""

    # Sends query to google api endpoint.
    # Appends the api key if it exists in ENV
    # Handles the response from google.
    def self.get(endpoint : String, params : Hash)
      append_key(params)
      response = HTTP::Client.get "#{BASE_URL}#{endpoint}/json?#{to_query_string(params)}"
      handle_response(response)
    end

    # Handle's the response from Google. Parsing the response body or raising errors
    # as necessary
    private def self.handle_response(response)
      case response.status_code
      when 200..299
        parsed = JSON.parse(response.body)
        raise GoogleMapsApi::Errors::ClientError.new(parsed["error_message"].to_s) if parsed["error_message"]?
        (parsed["results"]? ? parsed["results"] : parsed["result"]).to_json
      when 400..499
        puts "error"
        puts response.body
      when 500
        raise GoogleMapsApi::Errors::ServerError.new("Internal Server Error")
      when 502
        raise GoogleMapsApi::Errors::ServerError.new("Bad Gateway")
      when 503
        raise GoogleMapsApi::Errors::ServerError.new("Service Unavailable")
      when 504
        raise GoogleMapsApi::Errors::ServerError.new("Gateway Timeout")
      else
        raise Exception.new("Uncaught error")
      end
    end

    # Appends `api_key` parameter if it exists in ENV["GOOGLE_API_KEY"]
    private def self.append_key(params : Hash)
      return if API_KEY.empty?
      params[:key] = API_KEY
    end

    # Parses params hash and returns a query string
    private def self.to_query_string(params : Hash)
      HTTP::Params.build do |form|
        params.each do |key, value|
          form.add(key.to_s, value.to_s)
        end
      end
    end
  end
end