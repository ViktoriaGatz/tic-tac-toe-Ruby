require_relative 'User'

class Player
	attr_accessor :win, :path
	def initialize(win)
		@win = win;
		@path = "../sourse/3.png"
	end
end
