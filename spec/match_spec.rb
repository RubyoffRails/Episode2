require 'rspec'
require_relative "../lib/match"

describe Match do
	let(:bob) { Fighter.new("bob") }
	let(:fred) { Fighter.new("fred") }

	subject { Match.new(bob,fred) }

	it "should have two opponents" do
		subject.opponents.should eq([bob, fred])
	end
	it "should have 13 turns" do
		subject.turns.count.should eq(13)
	end
	it "should have a winner" do
		[bob,fred].should include subject.winner
	end

	it "should declare bob the winner if bob wins more" do
		subject.stub(:winner_count_for_opponent).with(bob) {8}			
		subject.stub(:winner_count_for_opponent).with(fred) {5}			
		subject.winner.should eq(bob)
	end
	it "should declare fred the winner if fred wins more" do
		subject.stub(:winner_count_for_opponent).with(bob) {3}
		subject.stub(:winner_count_for_opponent).with(fred) {10}			
		subject.winner.should eq(fred)
	end
	
	it "should print turns when requested" do
	  $stdout.should_receive(:puts).exactly(13).times
	  subject.print_turns
  end
  
  it "should print all turns and then the winner when replay is called" do
    $stdout.should_receive(:puts).exactly(14).times
	  subject.replay
  end
end
