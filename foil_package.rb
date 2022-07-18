require_relative 'package'
DEFAULT_COST = 10

class FoilPackage < Package
  def initialize(cost: DEFAULT_COST)
    super
  end
end
