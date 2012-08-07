require_relative "fighter"
class Match

  def initialize(opponent_a, opponent_b)
    @opponent_a = opponent_a
    @opponent_b = opponent_b
  end

  def opponents
    [@opponent_a, @opponent_b]
  end

  def round_winner(move_a, move_b)
    a = Move.new(move_a)
    b = Move.new(move_b)

    if a > b
      @opponent_a.points += 1
      @opponent_a.name
    elsif b > a
      @opponent_b.points += 1
      @opponent_b.name
    else
      nil
    end
  end
end
