require_relative "fighter"
require_relative "turn"
class Match

	attr_reader :turns
	def initialize(opponent_a, opponent_b)
		@opponent_a = opponent_a
		@opponent_b = opponent_b
		@turns = build_turns

	end
	
	def opponents
		[@opponent_a, @opponent_b]
	end

	def winner
		if winner_count_for_opponent(@opponent_a) > winner_count_for_opponent(@opponent_b)
			@opponent_a
		else
			@opponent_b
		end	
	end
	
	def winner_count
		if winner_count_for_opponent(@opponent_a) > winner_count_for_opponent(@opponent_b)
			winner_count_for_opponent(@opponent_a)
		else
			winner_count_for_opponent(@opponent_b)
		end	
	end
	
	
	def winner_count_for_opponent(opponent)

		@turns.select{ |turn| opponent.strike == turn.winner}.count
	end

	def turns_output
		@turns.select{ |turn| 
			if @opponent_a.strike == turn.winner
				puts "Opponent A  -- #{@opponent_a.name} -- won this turn"
        	else
        		puts "Opponent B  -- #{@opponent_b.name} -- won this turn"
        	end }
    end

	private
	def build_turns
		13.times.map do
			Turn.new(@opponent_a.strike, @opponent_b.strike)
		end
	end
		
end
