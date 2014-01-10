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
		if @move_a.type == :block && @move_b.type == :block
			[@move_a, @move_b].sample
		else
			[@move_a, @move_b].max { |a, b| a.ranking <=> b.ranking }
		end
	end
end

