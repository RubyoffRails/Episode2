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
		(0..99).should include Move.new(stub).ranking
	end

    it "can be compared to another move" do
      [true, false].should include Move.new(:strike) > Move.new(:strike)
    end

    it "considers two blocks equal" do
      (Move.new(:block) == Move.new(:block)).should be true
    end

    # I tried a bit, but wasn't able to figure out how to mock this.
    # So I had to recreate the logic of comparison in the test, which
    # feels stupid and error prone.
    it "correctly compares any other two moves" do
      first = Move.new(:strike)
      second = Move.new(:strike)

      if first.ranking > second.ranking
        (first > second).should be true
      elsif second.ranking > first.ranking
        (second > first).should be true
      else
        (second == first).should be true
      end
    end
end
