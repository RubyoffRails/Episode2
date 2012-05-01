require_relative "move"
class Fighter

	attr_reader :strike, :block, :name
	def initialize(name)
		@name = name
		@strike = Move.new(:strike)
		@block = Move.new(:block)
	end
end
