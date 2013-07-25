require_relative "move"
class Turn
	attr_reader :winner, :move_a, :move_b
	def initialize(move_a, move_b)
		@move_a = move_a
		@move_b = move_b
		@winner = winner_for_turn(move_a, move_b)	
	end

	def winner_for_turn(move_a, move_b)
	  if move_a.type == :block && move_b.type == :block
	    [move_a, move_b].sample
    else
		  move_a.ranking > move_b.ranking ? @move_a : @move_b
	  end
	end	
end
