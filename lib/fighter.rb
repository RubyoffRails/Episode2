require_relative "move"
class Fighter

	attr_reader :strike, :block, :name, :last_move
	def initialize(name)
		@name = name
		@strike = Move.new(:strike)
		@block = Move.new(:block)
		@last_move = random_move #default to a random move
	end

	def move=(value)
		if value.nil?
			@last_move = random_move
		elsif value.is_a? Move
			@last_move = value
		else
			@last_move = (value.to_sym == :strike ? @strike : @block)
		end
	end

	def random_move
		[@strike, @block].sample
	end
end