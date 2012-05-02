Dir["./lib/*.rb"].each {|file| require file }

fighter_a = "Nancy Botwin" 
fighter_b = "Celia Hodes" 

for i in 1..13 do
  match = Match.new(Fighter.new(fighter_a), Fighter.new(fighter_b))
  puts "The winner of match #{i} is ....... #{match.winner.name}"
end
  