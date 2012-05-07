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
	
	def score
    a = @turns.select{ |turn| @opponent_a == turn.winning_fighter }.count
    b = @turns.select{ |turn| @opponent_a == turn.losing_fighter }.count
    if a > b
      {:winning_score => a, :winning_fighter => @opponent_a, :losing_score => b, :losing_fighter => @opponent_b}
    else
      {:winning_score => b, :winning_fighter => @opponent_b, :losing_score => a, :losing_fighter => @opponent_a}
    end
	end
	 
	private
	def build_turns	  
		13.times.map do
      begin
  	    move_a = @opponent_a.choose_move_type
  	    move_b = @opponent_b.choose_move_type
        if move_a.type == :block && move_b.type == :block
          raise "Both fighters may not block. Please choose moves again." 
        end
  	  rescue Exception => e  
  	    puts e.message
  	    retry
  	  end
      Turn.new(@opponent_a, move_a, @opponent_b, move_b)
		end
	end

end
