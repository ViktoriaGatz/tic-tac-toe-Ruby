=begin
Shoes.app :title => "tic tac toe" do
	background white..gray
	# title("Shoooes", top: 60, align: "center", font: "Trebuchet MS", stroke: white)
	@rect1 = nil
	@rect2 = nil
	@rect3 = nil
	field() do
		style(:margin_left => 130, :margin_top => 90)
#		rect1 = rect()
		fill red
		@rect1 = rect(width: 100)
		@rect1.style(border: 'none')
		@rect2 = rect(left: 110, width: 100)
		@rect3 = rect(left: 220, width: 100)
		@rect4 = rect(top: 110, width: 100)
		@rect5 = rect(top: 110, left: 110, width: 100)
		@rect6 = rect(top: 110, left: 220, width: 100)
		@rect4 = rect(top: 220, width: 100)
		@rect5 = rect(top: 220, left: 110, width: 100)
		@rect6 = rect(top: 220, left: 220, width: 100)
	end
	field()
end
вся длина - х пикселей
объект - 100 пикселей
объектов в строке - 3
строк - 3
=end

Shoes.app :title => "tic tac toe", :width => 480, :height => 480 do
	background "../sourse/1.png"
	stack do
		@image = image("../sourse/2.png", top: top, left: top)
    	motion do |left, top|
      		@image.move left - 30, top - 30
			click do
				if @clickable
					if (@image.path <=> "../sourse/3.png") == 0
						@image = image("../sourse/2.png", top: top - 30, left: left - 30)
					else
						@image = image("../sourse/3.png", top: top - 30, left: left - 30)
					end
				end
			end
			start do
				@clickable = true
			end
    	end
 	end
=begin
=end
end
class Field
	def initialize
		@field = Array.new()
		for i in (0..2)
			newArray = Array.new()
			for j in (0..2)
				square = Square.new
		    	newArray << square
			end
			@field << newArray
		end
	end
	def printField
		for i in (0..2)
			for j in (0..2)
				print "#{@field[i][j].get}\t";
			end
			print "\n"
		end
	end
end

class Square
	def initialize
		@image = nil
		@free = true
		@xORo = -1
	end
	def set(xORo)
		@free = false
		if (xORo <= 1 and xORo >=-1)
			@xORo = xORo
		end
	end
	def get
		@xORo
	end
end

class Main
	field = Field.new()
	field.printField()
end

Main
