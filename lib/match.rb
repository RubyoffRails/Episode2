require_relative "fighter"
require_relative "turn"

require 'pp'

class Match
	
	attr_reader :turns
	def initialize(opponent_a, opponent_b)
		@opponent_a = opponent_a
		@opponent_b = opponent_b
		@turns = build_turns
		@results = []
	end
	
	def opponents
		[@opponent_a, @opponent_b]
	end

	def winner
    fight!
    if winner_count_for_opponent(@opponent_a.name) > winner_count_for_opponent(@opponent_b.name)
      @opponent_a
    else
      @opponent_b
    end
	end

  def winner_count_for_opponent(opponent)
  	@results.select{|winner| opponent == winner}.count
  end
	
	private
	def build_turns
		13.times.map do 
		  Turn.new(@opponent_a.strike, @opponent_b.strike)
		end
	end
	
	def fight!
	  round_num = 1
    @turns.each do |turn|
      puts "Round #{round_num}. FIGHT!"
      if turn.move_a == turn.winner
        puts "Round won by #{@opponent_a.name}"
        @results << @opponent_a.name
      else
        puts "Round won by #{@opponent_b.name}"
        @results << @opponent_b.name
      end
      round_num += 1
    end
  end
end
