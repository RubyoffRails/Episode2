require 'rspec'
require_relative "../lib/turn"

describe Turn do
	let(:strike_a) { Move.new(:strike) }
	let(:strike_b) { Move.new(:strike) }
	let(:block_a) { Move.new(:block) }
	let(:block_b) { Move.new(:block) }
	
	subject { Turn.new(strike_a, strike_b) }

	it "should have a winner" do
		[strike_a, strike_b].should include subject.winner
	end
	
	it "should determine winner on rank during strike v strike" do
	  strike_a.stub(:ranking) { 50 }
	  strike_b.stub(:ranking) { 40 }
	  subject.stub(:winner_for_turn).with(strike_a, strike_b)
	  subject.winner.should eq(strike_a)
  end
  
  it "should determine winner on rank during strike v block" do
    strike_a.stub(:ranking) { 50 }
	  block_b.stub(:ranking) { 60 }
    turn = Turn.new(strike_a, block_b)
    turn.winner.should eq(block_b)
  end
  
  it "should have a winner on block v block" do
    turn = Turn.new(block_a, block_b)
    [block_a, block_b].should include turn.winner
  end
end
