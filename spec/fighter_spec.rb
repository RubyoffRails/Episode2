require 'rspec'
require_relative "../lib/fighter"

describe Fighter do

	subject { Fighter.new("Bob") }
	it "should have a strike" do
		subject.strike.should be_a(Move)
	end
	it "should have block" do
		subject.block.should be_a(Move)
	end

	it "should have a name" do
		Fighter.new("Mike Tyson").name.should eq("Mike Tyson")
	end

	it "should return a valid move" do
		subject.move = "strike"
		subject.last_move.should be_a(Move)
	end
end
