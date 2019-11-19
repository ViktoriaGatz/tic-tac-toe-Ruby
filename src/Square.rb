require_relative 'Player'
require_relative 'Bot'

class Square
	attr_accessor :path, :free, :xORo, :top, :left
	def initialize
		@free = true
		@xORo = -1
		@top = 125
		@left = 135
		@path = "../sourse/2.png"
	end
	def set(xORo)
		if (xORo == 1 or xORo == 0)
			@free = false
			@xORo = xORo
		end
	end
end
