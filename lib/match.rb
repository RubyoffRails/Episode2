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
		@turns.select{ |turn| opponent == turn.winner}.count
	end

	def replay
		@turns.each_with_index.map do |turn, turn_num|
			"Round #{turn_num+1} -- #{turn.winner.name.chomp} won!"
		end
	end

	private
	def build_turns
		13.times.map do |i|
			Turn.new(@opponent_a, @opponent_b)
		end
	end

end
