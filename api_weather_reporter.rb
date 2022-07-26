require 'faraday'
require 'faraday/net_http'
Faraday.default_adapter = :net_http
require_relative 'weather_reporter'
require 'json'

class ApiWeatherReporter < WeatherReporter
  def initialize(latitude:, longitude:, units: 'c')
    super
    @key = ENV["WEATHER_API_KEY"]
  end

  def load_temperature(date)
    q = "#{latitude}, #{longitude}"
    conn = Faraday.new(
      url: 'https://api.weatherapi.com/v1',
      params: { key: @key }
    )
    response = conn.get('history.json') do |req|
      req.params[:q] = q
      req.params[:dt] = date
    end
    weather_info = JSON.parse(response.body)
    temp_in_c = weather_info['forecastday']['day']['average'].to_f
    ensure_units(temp_in_c)
  end
end
