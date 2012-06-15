require_relative "move"
class Fighter

	attr_reader :name, :fight
	def initialize(name)
		@name = name
    @fight = []
	end

  def hit(name)
    @hit = Move.new(name)
    @fight << @hit
    return @hit
  end
end
