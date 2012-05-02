require_relative "move"
class Fighter

	attr_reader :strike, :block, :name, :last_move
	def initialize(name)
		@name = name
		@strike = Move.new(:strike)
		@block = Move.new(:block)
		@last_move = nil;
	end

	def move
		@last_move = [@strike, @block].sample
		@last_move
	end
end
