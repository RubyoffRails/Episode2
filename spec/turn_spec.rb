require 'rspec'
require_relative "../lib/turn"

describe Turn do
	let(:strike_a) { Move.new(:strike) }
	let(:strike_b) { Move.new(:strike) }

	it "should have a winner" do
		[strike_a, strike_b].should include Turn.new(strike_a, strike_b).winner
	end

  it "should win higher ranking move" do
    Turn.new(strike_a, strike_b).winner.ranking.should eq([strike_a.ranking, strike_b.ranking].max)
  end
end
