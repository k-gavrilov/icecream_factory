require_relative 'random_weather_reporter'
require_relative 'api_weather_reporter'
require_relative 'temperature_predictor'
require_relative 'ice_cream_factory'

tp = TemperaturePredictor.new(latitude: 48.15828369063265, longitude: 11.59861076780694)
factory = IceCreamFactory.new(name: 'Danone', predictor: tp)
batch = factory.produce!(quantity: 10)
puts batch.size
ice_cream = batch[0]
ice_cream.open
puts ice_cream.opened?
puts ice_cream.cost