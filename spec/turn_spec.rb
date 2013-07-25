require 'rspec'
require_relative "../lib/turn"

describe Turn do
	let(:strike_a) { Move.new(:strike) }
	let(:strike_b) { Move.new(:strike) }
	
	subject { Turn.new(strike_a, strike_b) }

	it "should have a winner" do
		[strike_a, strike_b].should include subject.winner
	end
	
	it "should determine winner based on move ranking" do
	  strike_a.stub(:ranking) { 50 }
	  strike_b.stub(:ranking) { 40 }
	  subject.stub(:winner_for_turn).with(strike_a, strike_b)
	  subject.winner.should eq(strike_a)
  end
end
