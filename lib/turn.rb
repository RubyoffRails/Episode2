require_relative "move"
class Turn
	attr_reader :winner
	def initialize(move_a, move_b)
		@move_a = move_a
		@move_b = move_b
		@winner = determine_winner	
	end

	private
	def determine_winner
		[@move_a, @move_b].sample
	end	
end
