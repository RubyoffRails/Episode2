require_relative "move"
class Turn
	attr_reader :winner, :loser
	def initialize(fighter_a, fighter_b)
		@fighter_a = fighter_a
		@fighter_b = fighter_b
		determine_winner
	end

	private
	def determine_winner
		
		if @fighter_a.move.ranking > @fighter_b.move.ranking
			@loser = @fighter_b
			@winner = @fighter_a
		else
			@loser = @fighter_a
			@winner = @fighter_b
		end
	end	
end
