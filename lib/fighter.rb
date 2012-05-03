require_relative "move"
class Fighter
  include Comparable

  attr_reader :name
  attr_accessor :points

  def initialize(name)
    @name = name
    @points = 0
  end

  def <=>(other)
    self.points <=> other.points
  end
end
