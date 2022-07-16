require_relative 'random_weather_reporter'
require_relative 'temperature_predictor'

reporter = RandomWeatherReporter.new(latitude: 53.1, longitude: 86.2)
puts reporter.load_temperature(Time.now)
tp = TemperaturePredictor.new(latitude: 53.1, longitude: 86.2)
puts tp.predict_for_tomorrow