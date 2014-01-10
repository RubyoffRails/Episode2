require 'rspec'
require_relative "../lib/turn"

describe Turn do
	let(:strike_a) { Move.new(:strike) }
	let(:strike_b) { Move.new(:strike) }

	it "should have a winner" do
		[strike_a, strike_b].should include Turn.new(strike_a, strike_b).winner
	end

  it "should select move with the higher rank as the turn winner" do
    strike_c = double("strike_c", ranking: 90, type: :strike)
    strike_d = double("strike_d", ranking: 50, type: :block)

    Turn.new(strike_c, strike_d).winner.should eq(strike_c)
  end

  it "should pick a random winner if it's block vs block" do
    strike_e = double("strike_e", type: :block)
    strike_f = double("strike_f", type: :block)

    [strike_e, strike_f].should include Turn.new(strike_e, strike_f).winner
  end


end
