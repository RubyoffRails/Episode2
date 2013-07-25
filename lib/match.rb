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
		@turns.select{ |turn| opponent.strike == turn[:winner]}.count
	end
	
	def print_turns
	  @turns.each do |turn|
	    print turn[:text]
    end
  end
  
  def replay
    print_turns
    print "The winner of match is ....... #{winner.name}\n"
  end

	private
	def build_turns
		13.times.map do
			turn = Turn.new(@opponent_a.fight, @opponent_b.fight)
			text = "Opponent A: #{@opponent_a.name} #{turn.move_a.type}"\
			       " #{turn.move_a.ranking}\nOpponent B: #{@opponent_b.name} "\
			       "#{turn.move_b.type} #{turn.move_b.ranking}\n"
			if turn.winner == @opponent_a.fight
        {winner: turn.winner, text: text + "Winner: Opponent A\n"}
      else
        {winner: turn.winner, text: text + "Winner: Opponent B\n"}
      end
		end
	end

end
