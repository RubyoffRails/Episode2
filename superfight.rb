Dir["./lib/*.rb"].each {|file| require file }


puts "What is your first fighter's name?"
fighter_a = $stdin.gets.chomp
puts "What is your second fighter's name?"
fighter_b = $stdin.gets.chomp

match = Match.new(Fighter.new(fighter_a), Fighter.new(fighter_b))

puts "The winner of match is ....... #{match.winner.name}"
