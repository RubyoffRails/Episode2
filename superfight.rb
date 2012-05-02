Dir["./lib/*.rb"].each {|file| require file }

puts "What is your first fighter's name?"
fighter_a_name = $stdin.gets
puts "What is your second fighter's name?"
fighter_b_name = $stdin.gets

puts "\n\n"
puts "Leeettttttttttttttt's get ready to rummmmmmmbbbblllllllleeeeee!"
puts "\n\n"
sleep 0.5

fighter_a = Fighter.new(fighter_a_name)
fighter_b = Fighter.new(fighter_b_name)

match = Match.new(fighter_a, fighter_b)

round = 1
fighter_a_rounds_won = 0
match.turns.each do |turn|
	fighter_a_rounds_won+=1 if turn.winner == fighter_a
	puts "The winner for round #{round} is #{turn.winner.name}"
	round += 1
	sleep 1
end

puts "\n\n"
puts ["Judges are talking...", "Calculating results...."].sample
puts "\n\n"
sleep 1.5

if match.winner == fighter_a
	rounds = fighter_a_rounds_won
else
	rounds = match.turns.count - fighter_a_rounds_won
end

puts "The winner of match with #{rounds} rounds won is......."
puts "\n"

sleep 1.5

puts match.winner.name

sleep 2
puts "\n\n"
puts "Thank you for joining us. The gift shop is open!"
puts "\n\n"