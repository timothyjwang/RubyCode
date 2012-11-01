# Play with more advanced parts of the ERB class - including use with HTML.
# Following information from:
	# http://ruby-doc.org/stdlib-1.9.3/libdoc/erb/rdoc/ERB.html

# Note: no cats are actually being sold.



deez_fluffy_kitties = []

require 'erb'

class Fluffy_Kitten
	def initialize ( name, gender, color, fluffyness )
		@name = name
		@gender = gender
		@color = color
		@fluffyness = fluffyness

		@points_of_interest = []
	end

	def add_point_of_interest( point )
		@points_of_interest << point
	end

	# Support templating of member data.
	def get_binding
		binding
	end
end

# Creating a template
template = %{
	<html>
		<head><title>Fluffy's Fluffy Kitty Emporium!</title></head>
		<body>
			<h1>Fluffy Kittens for sale:</h1>
				<ul>
					<li><%= @name %> is a <%= @color %> <%= @gender %> kitty.<br>
					<%= @name %>'s level of fluffinisity is: <%= @fluffyness %>.<br>
					Points of interest regarding <%= @name %>:<br>
					<% @points_of_interest.each do |point| %>
						<li><%= point %></li>
					<% end %>
					</li>
				</ul>
		</body>
	</html>
}.gsub(/^  /, '')

rhtml = ERB.new(template)

fluffywillykitty = Fluffy_Kitten.new("Willamette", "female", "grey", "omgwtfbbqfluffykitty")
fluffywillykitty.add_point_of_interest("Fluffy.  Extremely fluffy.")
fluffywillykitty.add_point_of_interest("Has been known to ambush people and attack feet during dark hours.  A night-hunter, of sorts.")

kitty_prince = Fluffy_Kitten.new("Prince", "male", "black and white", "standard, close-lying coat of fur")
kitty_prince.add_point_of_interest("Affectionate attention-seeker - loves to be pet a lot, but will lie on your lap for hours and not want to move.")

kitty_mindy = Fluffy_Kitten.new("Mindy", "female", "orange", "standard, close-lying coat of fur - soft")
kitty_mindy.add_point_of_interest("Extremely shy, easy to frighten - but once she warms up to you, she is a giant sweetheart.")

deez_fluffy_kitties << fluffywillykitty
deez_fluffy_kitties << kitty_prince
deez_fluffy_kitties << kitty_mindy

rhtml.run(fluffywillykitty.get_binding)
