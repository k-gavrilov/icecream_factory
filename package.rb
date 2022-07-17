class Package
  attr_reader :cost, :open

  def open!
    raise NoMethodError, "Method should be implemented in concrete classes"
  end

  def open?
    raise NoMethodError, "Method should be implemented in concrete classes"
  end
end