require 'rspec'
require_relative '../lib/move'

describe Move do

	it "can be a strike" do
		Move.new(:strike).type.should eq(:strike)
	end
	it "can be a block" do
		Move.new(:block).type.should eq(:block)
	end
	it "has a ranking" do
		(1..100).should include Move.new(stub).ranking 
	end
end
