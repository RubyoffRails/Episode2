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
      winner = winner_for_round(turn) 
      puts "Turn #{index + 1}: #{winner.name} won the round with a move ranking of #{winner.strike.ranking}"
    end
  end

	private

	def build_turns
		13.times.map do
			turn = Turn.new(@opponent_a.strike, @opponent_b.strike)
      puts "#{winner_for_round(turn).name} won that round!"   
      turn
		end
	end

  def winner_for_round(turn)
    turn_winner = @opponent_a.strike == turn.winner ? @opponent_a : @opponent_b   
  end

end
