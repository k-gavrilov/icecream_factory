require_relative 'random_weather_reporter'
require_relative 'temperature_predictor'
require_relative 'ice_cream_factory'

reporter = RandomWeatherReporter.new(latitude: 53.1, longitude: 86.2)
puts reporter.load_temperature(Time.now)
tp = TemperaturePredictor.new(latitude: 53.1, longitude: 86.2)
factory = IceCreamFactory.new(name: 'Danone', predictor: tp)
batch = factory.produce!(quantity: 10)
puts batch.size