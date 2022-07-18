class Package
  attr_reader :cost, :opened

  def initialize(cost:)
    @cost = cost
    @opened = false
  end

  def open
    @opened = true
  end

  def opened?
    opened
  end
end