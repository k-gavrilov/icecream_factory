require_relative 'weather_reporter'

class RandomWeatherReporter < WeatherReporter
  MIN_TEMP_IN_C = -50.0
  MAX_TEMP_IN_C = 50.0

  def load_temperature(date)
    random_temperature
  end

  private

  def random_temperature
    temp_in_c = rand(MIN_TEMP_IN_C..MAX_TEMP_IN_C)
    ensure_units(temp_in_c).round(1)
  end

end
