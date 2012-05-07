require 'rspec'
require_relative "../lib/match"

describe Match do
	let(:bob) { Fighter.new("bob") }
	let(:fred) { Fighter.new("fred") }

	subject {Match.new(bob,fred) }

	it "should have two opponents" do
		subject.opponents.should eq([bob, fred])
	end

	it "should have 13 turns" do
		subject.turns.count.should eq(13)
	end

	it "should have a winner" do
		[bob,fred].should include subject.score[:winning_fighter]
	end

  it "should output a score that equals 13" do 
    (subject.score[:winning_score] + subject.score[:losing_score]).should eq(13)
  end
  
  it "should ensure that the winner has the highest score" do
    (subject.score[:winning_score] > subject.score[:losing_score]).should be_true
  end
  
end
