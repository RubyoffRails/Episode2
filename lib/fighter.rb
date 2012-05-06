require_relative "move"
class Fighter

	attr_reader :name, :strike, :block, :name
	def initialize(name)
		@name = name
		@block = Move.new(:block)
	end
	
	def strike
	  Move.new(:strike)
	end
	
end
