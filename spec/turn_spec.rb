require 'rspec'
require_relative "../lib/turn"
require_relative "../lib/fighter"

describe Turn do
	let(:fighter_a) { Fighter.new("Bob") }
	let(:fighter_b) { Fighter.new("Bob's Uncle") }

	it "should have a winner" do
		[fighter_a, fighter_b].should include Turn.new(fighter_a, fighter_b).winner
	end

	it "should choose a winner based on highest move ranking" do
		turn = Turn.new(fighter_a, fighter_b)
		winner = turn.winner
		loser = turn.loser
		winner.last_move.ranking.should be > loser.last_move.ranking
	end
end