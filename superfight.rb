Dir["./lib/*.rb"].each {|file| require file }


puts "What is your first fighter's name?"
fighter_a = $stdin.gets.chomp
puts "What is your second fighter's name?"
fighter_b = $stdin.gets.chomp

match = Match.new(Fighter.new(fighter_a), Fighter.new(fighter_b))

i = 0

match.turns.each do |turn|
  i += 1
  puts ""
  puts "Round #{i}"
  puts "#{fighter_a} #{turn.move_a.type} and wins #{turn.move_a.ranking} points \n#{fighter_b} #{turn.move_b.type} and wins #{turn.move_b.ranking} points"

end
puts ""
puts "#{match.opponent_a.name} wins #{match.winner_count_for_opponent(match.opponent_a)} turns"
puts "#{match.opponent_b.name} wins #{match.winner_count_for_opponent(match.opponent_b)} turns"
puts ""
puts "The winner of match is ....... #{match.winner.name}"
