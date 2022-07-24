require_relative 'random_weather_reporter'
require_relative 'api_weather_reporter'
require_relative 'temperature_predictor'
require_relative 'ice_cream_factory'

# reporter = RandomWeatherReporter.new(latitude: 53.1, longitude: 86.2)
# puts reporter.load_temperature(Time.now)
# tp = TemperaturePredictor.new(latitude: 53.1, longitude: 86.2)
# factory = IceCreamFactory.new(name: 'Danone', predictor: tp)
# batch = factory.produce!(quantity: 10)
# puts batch.size
# ice_cream = batch[0]
# ice_cream.open
# puts ice_cream.opened?
# puts ice_cream.cost
reporter = ApiWeatherReporter.new(latitude: '48.15828369063265', longitude: '11.59861076780694')
puts reporter.load_temperature(Time.now).inspect