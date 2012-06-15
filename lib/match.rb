require_relative "fighter"
require_relative "turn"
class Match

	attr_reader :turns, :opponent_a, :opponent_b
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
		i = 0
		wins = 0

		@turns.each do |turn|
			if opponent.fight[i] == turn.winner
				wins +=1
			end
			i += 1
		end

		return wins
	end

	private
	def build_turns
		13.times.map do
			Turn.new(@opponent_a.hit("strike"), @opponent_b.hit("block"))
		end
	end

end
