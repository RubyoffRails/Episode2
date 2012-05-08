require 'rspec'
require_relative "../lib/turn"
require_relative "../lib/fighter"

describe Turn do
	let(:fighter_a) { Fighter.new("Bob") }
	let(:fighter_b) { Fighter.new("Bob's Uncle") }

	it "should have a winner" do
		[fighter_a, fighter_b].should include Turn.new(fighter_a, fighter_b).winner
	end

	it "should have a loser" do
		[fighter_a, fighter_b].should include Turn.new(fighter_a, fighter_b).loser
	end

	it "should choose the winner a strike vs a block randomly" do
		#how do you test for a random result?
	end

	it "should choose a winner based on highest move ranking for strike vs strike" do
		fighter_a.move = :strike
		fighter_b.move = :strike
		turn = Turn.new(fighter_a, fighter_b)
		turn.winner.last_move.ranking.should be > turn.loser.last_move.ranking
	end
end