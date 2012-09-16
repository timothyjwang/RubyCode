# Made for use with Shoes.

Shoes.app :width => 800, :height => 600 do
	red = "#FF0000"
	green = "#00FF00"
	blue = "#0000FF"
	yellow = "FFFF00"
	purple = "FF00FF"
	cyan = "00FFFF"
	orange = "FF6600"
	white = "FFFFFF"
	black = "000000"

	# rect 50, 50, 100, 100, :fill => blue
	# first number, how far over from the left-margin it goes to begin drawing
	# second number, how far down from the top-margin it goes to begin drawing
	# third number, how wide the item is drawn
	# fourth number, how tall the item is drawn

	@cards = []

	3.times do |row|
		4.times do |column|
			r = rect 200 * column + 50,
			200 * row + 50, 100, 100, :fill => white
		
			@cards << r
		end
	end

	# Either 'animate do' or 'click do'
	animate do
		button, x, y = self.mouse
		column = x / 200
		row = y / 200
		over_x = x % 200
		over_y = y % 200
		space = (4 * row) + column

		if button == 1
			if (50..150).include?(over_x)
				if (50..150).include?(over_y)
					color = rgb(rand() * 255, rand() * 255, rand() * 255)
					@cards[space].style(:fill => color)
				end
			end
		else
			@cards.each {|card| card.style(:fill => white)}
		end
	end

end
