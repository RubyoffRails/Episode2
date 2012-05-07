require_relative "move"
class Turn
	attr_reader :winner
	def initialize(fighter_a, fighter_b)
		@fighter_a = fighter_a
		@fighter_b = fighter_b
		@winner = determine_winner	
	end

	private
  # The ranking is set to a random value only once.
  # Therefore the winner for each round will always be the same.
	def determine_winner
    winning_move = [@fighter_a.strike, @fighter_b.strike].max_by { |move| move.ranking }
    winning_move == @fighter_a.strike ? @fighter_a : @fighter_b
  end
end
