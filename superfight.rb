Dir["./lib/*.rb"].each {|file| require file}


puts "what is your first fighter's name?"

fighter_a = $stdin.gets

puts "what is your second fighter's name?"

fighter_b = $stdin.gets

puts "You said #{fighter_a} and #{fighter_b} will fight"
puts ""

match = Match.new(Fighter.new(fighter_a), Fighter.new(fighter_b))

puts "#{match.turns_output}"

puts "The winner of the match is #{match.winner.name} with #{match.winner_count} turns out of 13"