require_relative "move"
class Fighter

  attr_accessor :strike
	attr_reader :block, :name

	def initialize(name)
		@name = name
		@strike = Move.new(:strike)
		@block = Move.new(:block)
	end

  # Tried to create truly random winners in each fight but need to refactor 
  # a lot more code. I basically got it working but then it broke the replay method.
  def generate_new_strikes
    self.strike = Move.new(:strike) 
  end
end
