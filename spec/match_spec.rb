require 'rspec'
require_relative "../lib/match"
require_relative "../lib/turn"


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

	it 'should output the winner of each turn' do
		fixed_match = Match.new(bob, bob)
		expect(fixed_match.replay[0..1]).to eq(["Round 1 -- bob won!", "Round 2 -- bob won!"])
	end
end
