require_relative "move"
class Fighter

	attr_reader :name, :strike, :block, :name
	def initialize(name)
		@name = name
	end
	
	def block
	  Move.new(:block)
	end
	
	def strike
	  Move.new(:strike)
	end
	
	def choose_move_type
    puts "Strike [1] or Block [2]?"
    case gets.chomp
    when "1" || "[1]"
      self.strike
    when "2" || "[2]"
      self.block
    else 
      self.strike
    end
	end
	
end
