require 'faraday'
require 'faraday/net_http'
Faraday.default_adapter = :net_http
require_relative 'weather_reporter'

class ApiWeatherReporter < WeatherReporter
  def initialize(latitude:, longitude:, units: 'c')
    super
    @key = ENV["WEATHER_API_KEY"]
  end

  def load_temperature(time)
    q = "#{latitude}, #{longitude}"
    conn = Faraday.new(
      url: 'https://api.weatherapi.com/v1',
      params: { key: @key }
    )
    response = conn.get('current.json') do |req|
      req.params[:q] = q
    end
    response
  end
end
