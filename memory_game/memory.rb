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
	@colors = [red, green, blue, yellow, purple, orange]
	@picked = []
	@done = []
	@click_count = 0

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

	# 6.times do
	# 	@colors << rgb(rand() * 255, rand() * 255, rand() * 255)
	# end
	@colors = @colors * 2
	# @colors.sort! { rand(3) - 1 }
	# or could do:
	@colors.shuffle!

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
					# Increment @click_count here:
					@click_count += 1

					# "...then we reveal the color of the card underneath."
					@cards[space].style(:fill => @colors[space])
					@picked << space

					# Use .uniq! to resolve the issue where one can select the same card/space multiple times
					@picked.uniq!

					# Only show the two most-recently picked cards - if another is picked, we hide the "first"
					if @picked.size > 2
						# Hiding the "first" with shift
						@picked.shift
					end

					# "If the size of @picked == 2..."
					if @picked.size == 2
						# "...and they are both the same color..."
						if @colors[@picked[0]] == @colors[@picked[1]]
							# "...then put them both into @done."
							@done << @picked[0]
							@done << @picked[1]
							@done.uniq!
						end
					end

					if @done.size == 12
						alert("You win! You clicked #{@click_count} times.")
					end

				end
			end
		else
			# Show the color of the card - presently stays shown
			@cards.each_with_index { |c, space|
				if !@picked.include?(space)
					if !@done.include?(space)
						c.style(:fill => white)
					end
				end
			}
		end
	end

end
