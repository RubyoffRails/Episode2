require_relative "move"
class Turn
	attr_reader :winner
	def initialize(move_a, move_b)
		@move_a = move_a
		@move_b = move_b
		@winner = determine_winner	
	end

	private
  # The ranking is set to a random value only once.
  # Therefore the winner for each round will always be the same.
	def determine_winner
    [@move_a, @move_b].max_by { |move| move.ranking }
  end
end
