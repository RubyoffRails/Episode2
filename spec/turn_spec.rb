require 'rspec'
require_relative "../lib/turn"

describe Turn do
	let(:strike_a) { Move.new(:strike) }
	let(:strike_b) { Move.new(:strike) }

	it "should have a winner" do
		[strike_a, strike_b].should include Turn.new(strike_a, strike_b).winner
	end

  it "should select move with the higher rank as the turn winner" do
    strike_c = double("strike_c", ranking: 90)
    strike_d = double("Strike_d", ranking: 50)

    Turn.new(strike_c, strike_d).winner.should eq(strike_c)
  end
end
