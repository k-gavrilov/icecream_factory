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

  def ensure_units(temp_in_c)
    case (units)
    when 'f'
      (temp_in_c * 9 / 5) + 32
    else
      temp_in_c
    end
  end
end
