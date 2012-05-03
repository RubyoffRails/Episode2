require_relative "move"
class Fighter

	attr_reader :name
	def initialize(name)
		@name = name
	end

    def strike
      Move.new(:strike)
    end

    def block
      Move.new(:block)
    end
end
