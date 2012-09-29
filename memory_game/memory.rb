# Made for use with Shoes.

Shoes.app :width => 800, :height => 600 do
	# A variety of colors in hexidecimal:
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

	# First, @cards is an empty array:
	@cards = []
	@colors = []
	@picked = []

	# For three rows...
	3.times do |row|
		# ...we add four "columns" of cards...
		4.times do |column|
			# ...and define the space around each card, and the size of each card...
			# ...storing it in 'r':
			r = rect 200 * column + 50, 200 * row + 50, 100, 100, :fill => white
		
			# Adding 'r' to the array:
			@cards << r
		end
	end

	6.times do
		@colors << rgb(rand() * 255, rand() * 255, rand() * 255)
	end
	@colors = @colors * 2

	# (Either 'animate do' or 'click do')
	# Finding the space where the cursor currently is:
	animate do
		button, x, y = self.mouse
		column = x / 200
		row = y / 200
		over_x = x % 200
		over_y = y % 200
		space = (4 * row) + column

		# "If the mouse button is depressed..."
		if button == 1
			# "...and if the cursor is over a button space in x..."
			if (50..150).include?(over_x)
				# "...and in y..."
				if (50..150).include?(over_y)
					# "...then we reveal the color of the card underneath."
					@cards[space].style(:fill => @colors[space])
					@picked << space
				end
			end
		else
			# Show the color of the card - presently stays shown
			@cards.each_with_index { |c, space|
				if !@picked.include?(space)
					c.style(:fill => white)
				end
			}
		end
	end

end
