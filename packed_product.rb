class PackedProduct
  attr_reader :cost, :package, :empty

  def initialize
    @empty = false
  end

  def open
    raise NoMethodError, "Method should be implemented in concrete classes"
  end

  def open?
    raise NoMethodError, "Method should be implemented in concrete classes"
  end

  def empty?
    empty
  end
end
