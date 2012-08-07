require 'rspec'
require_relative "../lib/fighter"

describe Fighter do

  subject { Fighter.new("Bob") }

  it "should have a name" do
    subject.name.should eq("Bob")
  end

  it "should start with 0 points" do
    subject.points.should eq(0)
  end

  it "should be able to receive points" do
    subject.points += 1
    subject.points.should eq(1)
  end

  it "should be comparable to another fighter" do
    subject.points += 5
    rob = Fighter.new("Rob")
    rob.points += 2
    (rob < subject).should be true
    (subject < rob).should be false
    (subject == rob).should be false
    (subject == subject).should be true
    rob.points += 3
    (subject == rob).should be true
  end
end
