Dir["./lib/*.rb"].each {|file| require file }


print "What is your first fighter's name? "
fighter_a = gets.chomp
print "What is your second fighter's name? "
fighter_b = gets.chomp

match = Match.new(Fighter.new(fighter_a), Fighter.new(fighter_b))

match.turns.each do |turn|
  puts "#{fighter_a}'s strike: #{turn.move_a.ranking} :: #{fighter_b}'s strike #{turn.move_b.ranking}"
end

puts "The winner of match is ....... #{match.winner.name}"
