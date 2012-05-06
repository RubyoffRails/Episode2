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

	def winner_count_for_opponent(opponent)
		@turns.select{ |turn| opponent.strike == turn.winner}.count
	end

	private
	def build_turns
		13.times.map do
			turn = Turn.new(@opponent_a.strike, @opponent_b.strike)
      if @opponent_a.strike == turn.winner
        puts "#{@opponent_a.name} wins that round."
        turn
      else 
        puts "#{@opponent_b.name} wins that round."
        turn
      end
		end
	end

end
