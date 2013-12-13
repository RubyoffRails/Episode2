Dir["./lib/*.rb"].each {|file| require file }


puts "What is your first fighter's name?"
@fighter_a = $stdin.gets
puts "What is your second fighter's name?"
@fighter_b = $stdin.gets

match = Match.new(Fighter.new(@fighter_a), Fighter.new(@fighter_b)).tap do
	13.times.map do
	  match = Match.new
	    if @fighter_a.strike == turn.winner
	        puts "Fighter A  -- #{@fighter_a.name} -- won"
	    else
	        puts "Fighter B  -- #{@fighter_b.name} -- won"
	    end
	end
end

puts "The winner of match is ....... #{match.winner.name}"

# Moving away from random winners

class Move

	attr_reader :strike, :block, :leg_sweep

	def initialize
		@strike = strike
		@block = block
		@leg_sweep = leg_sweep
	end

	def values
		strike = 50
		block = 40
		leg_sweep = 60
	end

	def moves
		move = Move.new
		# test
		move.values{strike: 50, block: 40, leg_sweep: 60}
		puts moves.values.to_i

	end
end

match = Match.new(Fighter.new(@fighter_a), Fighter.new(@fighter_b)) do
	13.times.map do
		match = Match.new
	    if @fighter_a.moves > @fighter_b.moves
	        puts "Fighter A  -- #{@fighter_a.name} -- won"
	    else
	        puts "Fighter B  -- #{@fighter_b.name} -- won"
	    end
	end
end

