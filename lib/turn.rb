require_relative "move"
class Turn
	attr_reader :fighter_a_move, :fighter_b_move
	def initialize(fighter_a, fighter_b)
		@fighter_a = fighter_a
		@fighter_b = fighter_b
		@fighter_a_move = [@fighter_a.strike, @fighter_a.block].sample
		@fighter_b_move = [@fighter_b.strike, @fighter_b.block].sample
	end

	def tie
		[@fighter_a, @fighter_b].sample
	end

	def winner
		return tie if @fighter_a_move.type == :block and @fighter_b_move.type == :block
		@fighter_a_move.ranking > @fighter_b_move.ranking ? @fighter_a : @fighter_b
	end		
end
