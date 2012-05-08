require_relative "move"
class Turn
	attr_reader :winner, :loser
	def initialize(fighter_a, fighter_b)
		@fighter_a = fighter_a
		@fighter_b = fighter_b
		@fighters = [@fighter_a, @fighter_b]
		determine_winner
	end

	private
	def determine_winner
		move_a = @fighter_a.last_move
		move_a_type = move_a.type.to_sym
		move_b = @fighter_b.last_move
		move_b_type = move_b.type.to_sym

		if move_a_type == :strike and move_b_type == :strike
			if move_a.ranking > move_b.ranking
				@loser = @fighter_b
				@winner = @fighter_a
			else
				@loser = @fighter_a
				@winner = @fighter_b
			end
		elsif (move_a_type == :strike and move_b_type == :block) or (move_b_type == :strike and move_a_type == :block)
			#there HAS to be a cleaner way here
			@loser = @fighters.sample
			if @loser == @fighter_b
				@winner = @fighter_a
			else
				@winner = @fighter_b
			end
		else
			@fighter_b.move = "strike" #change the cpu fighter to a strike
			determine_winner
		end
	end	
end