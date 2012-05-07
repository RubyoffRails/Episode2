require 'rspec'
require_relative "../lib/turn"

describe Turn do
	let(:fighter_a) { Fighter.new(mock) }
	let(:fighter_b) { Fighter.new(mock) }

	it "should have a winner" do
		[fighter_a, fighter_b].should include Turn.new(fighter_a, fighter_b).winner
	end
end
