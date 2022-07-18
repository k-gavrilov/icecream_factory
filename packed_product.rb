require 'forwardable'

class PackedProduct
  attr_reader :package, :empty, :content_cost, :opened

  extend Forwardable
  def_delegators :package, :opened?, :open

  def initialize(content_cost:, package:)
    @empty = false
    @opened = false
    @content_cost = content_cost
    @package = package
  end

  def empty?
    empty
  end

  def cost
    content_cost + package.cost
  end
end
