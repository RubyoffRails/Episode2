Dir["./lib/*.rb"].each {|file| require file }


def get_move(fighter)
  print "\tWhat does #{fighter.name} do? (strike or block) "
  move = gets.chomp.to_sym

  until move == :strike || move == :block
    print "\tTry again: What does #{fighter.name} do? (strike or block) "
    move = gets.chomp.to_sym
  end

  move
end

def get_moves(fighter_a, fighter_b)
  a = get_move(fighter_a)
  b = get_move(fighter_b)

  [a, b]
end

def do_rounds(match)
  1.upto(12) do |n|
    puts "Round #{n}:"
    puts
    winner = match.round_winner(*get_moves(*match.opponents))

    if winner
      puts "\t#{winner} takes round #{n}."
    else
      puts "\tBoth fighters block. Round #{n} is a draw. Fight!"
    end
  end
end

def winner(victor)
  puts "*" * 75
  puts "#{victor.name} wins. Contratulations!"
  puts "*" * 75
end

def draw
  puts "-" * 75
  puts "It's a draw. Hit each other more next time!"
  puts "-" * 75
end

def show_winner(fighter_a, fighter_b)
  if fighter_a > fighter_b
    winner(fighter_a)
  elsif fighter_b > fighter_a
    winner(fighter_b)
  else
    draw
  end
end

print "What is your first fighter's name? "
first = gets.chomp
print "What is your second fighter's name? "
second = gets.chomp

fighter_a = Fighter.new(first)
fighter_b = Fighter.new(second)

match = Match.new(fighter_a, fighter_b)
do_rounds(match)
show_winner(fighter_a, fighter_b)
