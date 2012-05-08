Dir["./lib/*.rb"].each {|file| require file }

puts "\n\n"
print "Wellllllcommmmmeee "
sleep 0.5
print "to the "
sleep 0.5
print "Suppppppper Fight!"

puts "\n\n"

sleep 0.5

puts "What is your name?"
fighter_a_name = gets.chomp
puts "What is your opponents name?"
fighter_b_name = gets.chomp

puts "\n\n"
print "Leeettttttttttttttt's "
sleep 0.5
print "get ready to "
sleep 0.5
print "rummmmmmmbbbblllllllleeeeee!"

puts "\n\n"
sleep 0.5

fighter_a = Fighter.new(fighter_a_name)
fighter_b = Fighter.new(fighter_b_name)

match = Match.new(fighter_a, fighter_b)

puts "How many rounds in this match? (should be an odd number)"
total_rounds = gets.to_i
total_rounds = 13 if total_rounds == 0
total_rounds += 1 if total_rounds%2 == 0 #force an odd number of rounds

sleep 0.5

puts "Preparing for a #{total_rounds} round match."

puts "\n"

available_moves = [:strike, :block]

fighter_a_rounds_won = 0
total_rounds.times.each do |round|
	print "Round #{round+1}..."
	sleep 0.5
	print "fight!"
	puts "\n"
	puts "Do you want to strike (1) or block (2)?"
	move = gets.chomp
	puts "\n"
	move = available_moves[move.to_i-1] if ["1", "2"].include? move

	if !available_moves.include? move.to_sym
		move = available_moves.sample.to_s
		puts "Invalid move. Randomly chose a #{move} for you."
	end
	turn = match.take_turn move
	fighter_a_rounds_won+=1 if turn.winner == fighter_a

	winner_name = turn.winner.name
	winner_name = "You" if turn.winner == fighter_a
	puts "#{winner_name} won with a #{turn.winner.last_move.type}"
	puts "\n"
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

print "The winner of match with #{rounds} rounds won is......."

sleep 1.5

print "#{match.winner.name}!!" if match.winner == fighter_b
print "YOU!!" if match.winner == fighter_a

sleep 2
puts "\n\n"
puts ["Thank you for joining us. The gift shop is open!", "Don't forget to tip your waitress!", "No refunds."].sample
puts "\n\n"