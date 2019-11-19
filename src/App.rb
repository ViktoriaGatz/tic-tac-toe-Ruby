=begin
Shoes.app :title => "tic tac toe" do
	background white..gray
	# title("Shoooes", top: 60, align: "center", font: "Trebuchet MS", stroke: white)
	@rect1 = nil
	@rect2 = nil
	@rect3 = nil
	field() do
		style(:margin_left => 135, :margin_top => 90)
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
require_relative 'Field'

Shoes.app :title => "tic tac toe", :width => 480, :height => 480 do
	background "../sourse/1.png"
	@fieldN = Field.new()
	@win = false
	# @botN = Bot.new(@fieldN, @win)
	stack do
		@image = image("../sourse/2.png", top: top, left: left)
    	motion do |left, top|
      		@image.move left - 30, top - 30
			click do
				if @clickable
					check2(left, top)
					if @win == true
						background white..gray
						@clickable = false
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
	def randomBot()
		lol = true
		while lol do
			if checkWin(@fieldN.printField) == false
				return true
			end
			puts "lol #{lol}"
			for i in (0..2)
				for j in (0..2)
					topRAND = rand(135..350)
					leftRAND = rand(135..350)
					if topRAND.between?(@fieldN.get(i, j).top, @fieldN.get(i, j).top + 75) & leftRAND.between?(@fieldN.get(i, j).left, @fieldN.get(i, j).left + 75)
						if @fieldN.get(i, j).free
							image = image ("../sourse/3.png", top: @fieldN.get(i, j).top, left: @fieldN.get(i, j).left)
							@fieldN.get(i, j).set(0)
							return false
						end
					end
				end
			end
		end
	end

	def checkWin(array)
		puts "#{array}"
		for i in (0..2)
			for j in (0..2)
				if array[i][j] == -1
					return true
				end
			end
		end

		return false
	end

	def check2(left, top)
		for i in (0..2)
		for j in (0..2)
			if top.between?(@fieldN.get(i, j).top, @fieldN.get(i, j).top + 75) & left.between?(@fieldN.get(i, j).left, @fieldN.get(i, j).left + 75)
				if @fieldN.get(i, j).free
					image = image (@fieldN.get(i, j).path, top: @fieldN.get(i, j).top, left: @fieldN.get(i, j).left)
					@fieldN.get(i, j).set(1)
					@win = randomBot()
				end
			end
		end
		end
	end

end
