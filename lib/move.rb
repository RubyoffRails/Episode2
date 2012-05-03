class Move
  include Comparable

	attr_reader :type, :ranking
	def initialize(type)
		@type = type
        @ranking = create_ranking
	end

    def <=>(other)
      if self.type == :block && other.type == :block
        0
      else
        self.ranking <=> other.ranking
      end
    end

    private
    # To make the strike versus block ranking a bit weighted, I've
    # changed this. A strike is a random number 0-99, but a block is
    # only 0-75. A little tilt in the strike's favor.
    def create_ranking
      @type == :strike ? rand(100) : rand(76)
    end

end
