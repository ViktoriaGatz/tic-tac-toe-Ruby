require_relative 'Square'

class Field < Square
	def initialize
		top = 125
		left = 135
		@field = Array.new()
		for i in (0..2)
			newArray = Array.new()
			for j in (0..2)
				square = Square.new()
				square.left += j * 75;
				square.top += i * 75;
		    	newArray << square
			end
			@field << newArray
		end
	end

	def printField
		arrayReturn = Array.new()
		for i in (0..2)
			arrayNew = Array.new()
			for j in (0..2)
				arrayNew << @field[i][j].xORo
				#puts "#{@field[i][j].xORo}"
			end
			arrayReturn << arrayNew
		end
		return arrayReturn
	end

	def get(x, y)
		return @field[x][y]
	end
end
