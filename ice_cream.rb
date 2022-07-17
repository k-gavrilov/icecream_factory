require_relative 'packed_product'

class IceCream < PackedProduct
  def open
    @open = true
  end

  def open?
    @open
  end
end
