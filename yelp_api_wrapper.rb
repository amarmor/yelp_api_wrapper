class YelpApiWrapper
  require 'httparty'
  require 'dotenv'
  Dotenv.load

  attr_reader :headers, :base_url

  def initialize
    @headers = {"Authorization" => "Bearer #{ENV['YELP_API_TOKEN']}"}
    @base_url = "http://api.yelp.com/v3"
  end

  def get_restaurants_by_location(zip)
    endpoint = "#{base_url}/businesses/search?term=food&location=#{zip}"
    response = HTTParty.get(endpoint, headers: headers)
    response
  end
end
