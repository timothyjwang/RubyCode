# Play with more advanced parts of the ERB class - including use with HTML.
# Following information from:
	# http://ruby-doc.org/stdlib-1.9.3/libdoc/erb/rdoc/ERB.html

# Note: no cats are actually being sold.



require 'erb'

class Fluffy_Kitten
	def initialize ( name, gender, color, fluffyness )
		@name = name
		@gender = gender
		@color = color
		@fluffyness = fluffyness

		@points_of_interest = []
	end

	def this_cats_name
		@name
	end

	def this_cats_gender
		@gender
	end

	def this_cats_color
		@color
	end

	def this_cats_fluffyness
		@fluffyness
	end

	def traits
		@points_of_interest
	end

	def add_point_of_interest( point )
		@points_of_interest << point
	end
end

class All_Deez_Fluffy_Kittens
	def initialize
		@kittens = []
	end

	def add_this_kitten( kitten )
		@kittens << kitten
	end

	def kittens
		@kittens
	end

	# Support templating of member data.
	def get_binding
		binding
	end
end

fluffywillykitty = Fluffy_Kitten.new("Willamette", "female", "grey", "omgwtfbbqfluffykitty")
fluffywillykitty.add_point_of_interest("Fluffy.  Extremely fluffy.")
fluffywillykitty.add_point_of_interest("Has been known to ambush people and attack feet during dark hours.")

kitty_prince = Fluffy_Kitten.new("Prince", "male", "black and white", "standard, close-lying coat of fur")
kitty_prince.add_point_of_interest("Affectionate attention-seeker.")
kitty_prince.add_point_of_interest("Loves to cuddle, but will lie on your lap for hours and not want to move.")

kitty_mindy = Fluffy_Kitten.new("Mindy", "female", "orange", "standard, close-lying coat of fur - soft")
kitty_mindy.add_point_of_interest("Extremely shy, easy to frighten - is a giant sweetheart once she warms up to you.")

@all_the_kittens = All_Deez_Fluffy_Kittens.new
@all_the_kittens.add_this_kitten(fluffywillykitty)
@all_the_kittens.add_this_kitten(kitty_prince)
@all_the_kittens.add_this_kitten(kitty_mindy)

# Creating a template
template = %{
	<html>
		<head><title>Fluffy's Fluffy Kitty Emporium!</title></head>
		<body>
			<h1>Fluffy Kittens for sale:</h1>
				<ul>
					<% kittens.each do |kitty_cat| %>
						
					<li><%= kitty_cat.this_cats_name %> is a <%= kitty_cat.this_cats_color %> <%= kitty_cat.this_cats_gender %> kitty.<br>
					<%= kitty_cat.this_cats_name %>'s level of fluffinisity is: <%= kitty_cat.this_cats_fluffyness %>.<br>
					Points of interest regarding <%= kitty_cat.this_cats_name %>:<br>
					<% kitty_cat.traits.each do |point| %>
						<li><%= point %></li>
					<% end %>
					</li>

					<% end %>
				</ul>
		</body>
	</html>
}.gsub(/^  /, '')

rhtml = ERB.new(template)

rhtml.run(@all_the_kittens.get_binding)
