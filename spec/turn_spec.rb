require 'rspec'
require_relative "../lib/turn"

describe Turn do
	let(:strike_a) { Move.new(:strike) }
	let(:strike_b) { Move.new(:strike) }

	it "should have a winner" do
		[strike_a, strike_b].should include Turn.new(strike_a, strike_b).winner
	end
	
	it "should declare the higher ranking strike winner" do
	  strike_a.stub(:ranking) {8}
	  strike_b.stub(:ranking) {75}
	  Turn.new(strike_a, strike_b).winner.should eq(strike_b) 
  end
  
  it "should have a turn number" do
    
  end
  
end
