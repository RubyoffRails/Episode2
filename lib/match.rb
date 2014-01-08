require_relative "fighter"
require_relative "turn"
class Match

	attr_reader :turns
	def initialize(opponent_a, opponent_b)
		@opponent_a = opponent_a
		@opponent_b = opponent_b
		build_turns
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
		@turns.select{ |winner| opponent == winner}.count
	end

	def announce_turn_winners
		@turns.each_with_index do |winner, i|
			puts "#{winner.name} won round #{i+1}!"
		end
	end

	private
	def build_turns
		@turns = 13.times.map do |x|
			turn = Turn.new(@opponent_a.strike, @opponent_b.strike)
			if @opponent_a.strike == turn.winner
				@opponent_a
			else
				@opponent_b
			end
		end
	end
end
