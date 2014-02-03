require 'rspec'
require_relative "../lib/turn"

describe Turn do

  let(:fighter_a) { Fighter.new('bob') }
  let(:fighter_b) { Fighter.new('fred') }
  let(:strike_a) {Move.new(:strike)}
  let(:strike_b) {Move.new(:strike)}
  let(:block_a) {Move.new(:block)}
  let(:block_b) {Move.new(:block)}

  subject { Turn.new(fighter_a, fighter_b) }

  it "should have a winner" do
    [fighter_a, fighter_b].should include subject.winner
  end

  it "should determine winner by rank on strike vs strike" do
    # turn = Turn.new(fighter_a, fighter_b)
    strike_a.stub(:ranking) {99}
    strike_b.stub(:ranking) {1}
    subject.instance_variable_set(:@fighter_a_move, strike_a)
    subject.instance_variable_set(:@fighter_b_move, strike_b)
    expect(subject.winner).to eq(fighter_a)
  end

  it "should determine winner by rank on strike vs block" do
    # subject = subject.new(fighter_a, fighter_b)
    strike_a.stub(:ranking) {1}
    block_b.stub(:ranking) {99}
    subject.instance_variable_set(:@fighter_a_move, strike_a)
    subject.instance_variable_set(:@fighter_b_move, block_b)
    expect(subject.winner).to eq(fighter_b)
  end

  it "should determine winner on block vs block" do
    # subject = subject.new(fighter_a, fighter_b)
    block_a.stub(:ranking) {1}
    block_b.stub(:ranking) {99}
    subject.instance_variable_set(:@fighter_a_move, block_a)
    subject.instance_variable_set(:@fighter_b_move, block_b)
    expect([fighter_a, fighter_b]).to include(subject.winner)
  end
end
