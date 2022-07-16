require_relative 'random_weather_reporter'

class TemperaturePredictor
  SECONDS_IN_DAY = 60 * 60 * 24
  SECONDS_IN_YEAR = SECONDS_IN_DAY * 365
  attr_reader :latitude, :longitude, :units, :data_source, :prediction_type

  def initialize(latitude:, longitude:, units: 'c', data_source: nil, prediction_type: :average)
    @latitude = latitude
    @longitude = longitude
    @units = units
    @data_source = data_source ? data_source : RandomWeatherReporter.new(latitude: latitude, longitude: longitude)
    @prediction_type = prediction_type
  end

  def predict_for_tomorrow
    case (prediction_type)
    when :average
      get_average
    when :median
      get_median
    when :approx
      get_approx
    end
  end

  private

  def get_average
    temperatures = get_timestamps_for_past.map { |timestamp| data_source.load_temperature(timestamp) }
    (temperatures.sum / temperatures.size).round(2)
  end

  def get_median
    raise NoMethodError, "Method should be implemented in concrete classes"
  end

  def get_approx
    raise NoMethodError, "Method should be implemented in concrete classes"
  end

  def get_timestamps_for_past
    #TODO: track leap years
    tomorrow_timestamp = Time.now + SECONDS_IN_DAY
    (1..10).to_a.each_with_object([]) { |years_ago, stamps| stamps << tomorrow_timestamp - years_ago * SECONDS_IN_YEAR }
  end
end
