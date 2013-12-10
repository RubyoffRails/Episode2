Dir["./lib/*.rb"].each {|file| require file }


puts "What is your first fighter's name?"
fighter_a = $stdin.gets
puts "What is your second fighter's name?"
fighter_b = $stdin.gets

match = Match.new(Fighter.new(fighter_a), Fighter.new(fighter_b)) do
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
