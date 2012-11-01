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

rhtml.run(fluffywillykitty.get_binding)
