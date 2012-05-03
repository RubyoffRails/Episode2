require 'rspec'
require_relative "../lib/match"

describe Match do
  let(:bob) { Fighter.new("bob") }
  let(:fred) { Fighter.new("fred") }

  subject {Match.new(bob,fred) }

  it "should have two opponents" do
    subject.opponents.should eq([bob, fred])
  end

  it "should accept two strikes as a round and return a winner" do
    [bob.name, fred.name].should include subject.round_winner(:strike, :strike)
  end

  it "should accept a block and a strike and return a winner" do
    [bob.name, fred.name].should include subject.round_winner(:block, :strike)
  end

  it "should return nil if both players block" do
    subject.round_winner(:block, :block).should eq(nil)
  end
end
