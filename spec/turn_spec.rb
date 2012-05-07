require 'rspec'
require_relative "../lib/turn"

describe Turn do
	let(:strike_a) { Move.new(:strike) }
	let(:strike_b) { Move.new(:strike) }
	let(:fighter_a) { Fighter.new("Jim") }
	let(:fighter_b) { Fighter.new("Bob") }

	it "should have a winning strike" do
		[strike_a, strike_b].should include Turn.new(fighter_a, strike_a, fighter_b, strike_b).winning_move
	end
	
	it "should have a losing strike" do
	  [strike_a, strike_b].should include Turn.new(fighter_a, strike_a, fighter_b, strike_b).losing_move
	end
	
	it "should have a winning fighter" do
	  [fighter_a, fighter_b].should include Turn.new(fighter_a, strike_a, fighter_b, strike_b).winning_fighter
	end
		
	it "should have a losing fighter" do
	  [fighter_a, fighter_b].should include Turn.new(fighter_a, strike_a, fighter_b, strike_b).losing_fighter
	end		
end
