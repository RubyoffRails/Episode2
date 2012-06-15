require 'rspec'
require_relative "../lib/fighter"

describe Fighter do

	subject { Fighter.new("Bob") }

	it "should have a name" do
		Fighter.new("Mike Tyson").name.should eq("Mike Tyson")
	end
end
