Dir["./lib/*.rb"].each {|file| require file }


puts "What is your first fighter's name?"
fighter_a = gets.chomp
puts "What is your second fighter's name?"
fighter_b = gets.chomp

a = Fighter.new(fighter_a)
b = Fighter.new(fighter_b)

match = Match.new(a, b)

match.turns.each_with_index do |turn, index|

  puts "\nRound #{index+1}"
  puts "Winner: #{turn.winning_fighter.name} (#{turn.winning_move.type}, #{turn.winning_move.ranking})"
  puts "Loser: #{turn.losing_fighter.name} (#{turn.losing_move.type}, #{turn.losing_move.ranking})"
end  

puts "\nFinal Match Results: #{match.score[:winning_fighter].name} defeats #{match.score[:losing_fighter].name} (#{match.score[:winning_score]} to #{match.score[:losing_score]})"
