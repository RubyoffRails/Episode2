Episode2 - Superfight
=====================

A Game engine with Fighters, turns, and Matches

Panda Level
-----------

1. Read through the code when you start with Match.new
2. Inside the Match when it is fighting, output the winner of each Turn using something like:

```
13.times.map do
  turn = Turn.new ...
 	if @opponent_a.strike == turn.winner
		puts "Opponent A  -- #{@opponent_a.name} -- won"
	else
		puts "Opponent B  -- #{@opponent_b.name} -- won"
	end
end
```

Tiger Level
-----------

1. Instead of randomly selecting the winner of a turn, use the Move's ranking to determine a winner
2. Refactor the code that determines which fighter won a round to make it easy:

```
def winner_for_round(turn, opponent_a, oppoenent_b)
 ...
end
```

3. Create a `Match.replay` method that loops through the turns and outputs to the screen a listing of the turns and who won

Eagle level
------------

1. Strike vs Strike and Strike vs Block should let the higher rank win
2. Block vs Block should pick a random winner

Copyright: Jesse Wolgamott, MIT License (See LICENSE)
