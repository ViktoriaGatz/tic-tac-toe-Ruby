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
	@field = Field.new()
	stack do
		@image = image("../sourse/2.png", top: top, left: left)
    	motion do |left, top|
      		@image.move left - 30, top - 30
			click do
				if @clickable
					check(@feild, left, top)
				end
			end
			start do
				@clickable = true
			end
    	end
 	end
=begin
=end


def check(field, left, top)
	if top.between?(125, 200)
		if left.between?(125, 200)
			image = image ("../sourse/2.png", top: 125, left: 130)
		elsif left.between?(200, 275)
			image = image ("../sourse/2.png", top: 125, left: 215)
		elsif left.between?(275, 350)
			image = image ("../sourse/2.png", top: 125, left: 285)
		end
	end
	if top.between?(200, 275)
		if left.between?(125, 200)
			image = image ("../sourse/2.png", top: 200, left: 130)
		elsif left.between?(200, 275)
			image = image ("../sourse/2.png", top: 200, left: 215)
		elsif left.between?(280, 350)
			image = image ("../sourse/2.png", top: 200, left: 285)
		end
	end
	if top.between?(275, 350)
		if left.between?(125, 200)
			image = image ("../sourse/2.png", top: 275, left: 130)
		elsif left.between?(200, 275)
			image = image ("../sourse/2.png", top: 275, left: 215)
		elsif left.between?(280, 350)
			image = image ("../sourse/2.png", top: 275, left: 285)
		end
	end
	return field
end

end

class Field
	def initialize
		top = 125
		left = 125
		@field = Array.new()
		for i in (1..3)
			newArray = Array.new()
			for j in (1..3)
				square = Square.new
				square.left += j * 75;
				square.top += i * 75;
		    	newArray << square
			end
			@field << newArray
		end
	end
	def printField
		for i in (0..2)
			for j in (0..2)
				print "#{@field[i][j].top}\t";
				# print "#{@field[i][j].get}\t";
			end
			print "\n"
		end
	end
end

class Square
	attr_accessor :path, :free, :xORo, :top, :left
	def initialize
		@free = true
		@xORo = -1
		@top = 125
		@left = 125
		@path = "../sourse/2.png"
	end
	def set(xORo, left, right)
		if (xORo == 1 or xORo == 0)
			@free = false
			@xORo = xORo
		end
	end
end

class Main
end

Main
