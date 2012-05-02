require 'rspec'
require_relative "../lib/turn"

describe Turn do
	let(:strike_a) { Move.new(:strike) }
	let(:strike_b) { Move.new(:strike) }

	it "should have a winner" do
	  puts "winner: " +  Turn.new(strike_a, strike_b).winner.inspect
	  puts "a: #{strike_a.inspect}"
	  puts "b: #{strike_b.inspect}"
		[strike_a, strike_b].should include Turn.new(strike_a, strike_b).winner
	end
end
