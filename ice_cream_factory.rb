require_relative 'factory'
require_relative 'ice_cream'

class IceCreamFactory < Factory
  PRODUCT_CLASS = IceCream
  COEFFICIENT_FOR_WARM_WEATHER = 1.5
  COEFFICIENT_FOR_CHILLY_WEATHER = 0.5
  COEFFICIENT_FOR_NORMAL_WEATHER = 1
  NORMAL_WEATHER_HIGH_THRESHOLD = 30.0
  NORMAL_WEATHER_LOW_THRESHOLD = 10.0

  attr_reader :predictor

  def initialize(name:, predictor:)
    super(name: name)
    @predictor = predictor
  end

  def produce!(quantity:, product_class: PRODUCT_CLASS)
    super(quantity: corrected_quantity(quantity), product_class: product_class)
  end

  private
  def corrected_quantity(quantity)
    (quantity * prediction_coefficient).to_i
  end

  def prediction_coefficient
    temperature = predictor.predict_for_tomorrow
    coefficient =
      if temperature > NORMAL_WEATHER_HIGH_THRESHOLD
        COEFFICIENT_FOR_WARM_WEATHER
      elsif temperature < NORMAL_WEATHER_LOW_THRESHOLD
        COEFFICIENT_FOR_CHILLY_WEATHER
      else
        COEFFICIENT_FOR_NORMAL_WEATHER
      end
    coefficient
  end
end
