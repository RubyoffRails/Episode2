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

  def replay
    @turns.each_with_index do |turn, index|
      puts "Turn #{index + 1}: #{turn.winner.name} won that round!"
    end
  end

	private

	def build_turns
		13.times.map do
			turn = Turn.new(@opponent_a, @opponent_b)
      puts "#{turn.winner.name} won that round!"   
      @opponent_a.generate_new_strikes
      @opponent_b.generate_new_strikes
      turn
		end
	end
end
