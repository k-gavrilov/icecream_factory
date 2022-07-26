class WeatherReporter
  attr_reader :latitude, :longitude, :units

  def initialize(latitude:, longitude:, units: 'c')
    @latitude = latitude
    @longitude = longitude
    @units = units
  end

  def load_temperature(date)
    raise NoMethodError, "Method should be implemented in concrete classes"
  end
end
