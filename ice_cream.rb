require_relative 'packed_product'
require_relative 'foil_package'

class IceCream < PackedProduct
  DEFAULT_CONTENT_COST = 15
  def initialize(content_cost: DEFAULT_CONTENT_COST, package: FoilPackage.new)
    super(content_cost: content_cost, package: package)
  end
end
