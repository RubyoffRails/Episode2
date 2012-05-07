require_relative "move"
class Turn
	attr_reader :move_a, :move_b, :fighter_a, :fighter_b, :winning_move, :winning_fighter, :losing_move, :losing_fighter
	def initialize(fighter_a, move_a, fighter_b, move_b)
		@move_a = move_a
		@move_b = move_b
		@fighter_a = fighter_a
		@fighter_b = fighter_b
		@winning_move = determine_winning_move	
		@winning_fighter = determine_winning_fighter
		@losing_move = determine_losing_move	
		@losing_fighter = determine_losing_fighter	
	end

	private
	def determine_winning_move	
	  #@move_a.ranking > @move_b.ranking ? @move_a : @move_b
	  
	  if @move_a.type == :strike && @move_b.type == :strike
	    @move_a.ranking > @move_b.ranking ? @move_a : @move_b
	  else (@move_a.type == :strike && @move_b.type == :block) || (@move_a.type == :block && @move_b.type == :strike)
	    [@move_a, @move_b].sample
	  end
  end
  
  def determine_losing_move	
	  @move_a.ranking > @move_b.ranking ? @move_b: @move_a
  end
  
  def determine_winning_fighter	
    @move_a.ranking > @move_b.ranking ? @fighter_a : @fighter_b
  end
  
  def determine_losing_fighter	
    @move_a.ranking > @move_b.ranking ? @fighter_b : @fighter_a 
  end
  
end
