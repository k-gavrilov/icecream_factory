require_relative 'random_weather_reporter'

reporter = RandomWeatherReporter.new(latitude: 53.1, longitude: 86.2)
puts reporter.load_temperature(Time.now)