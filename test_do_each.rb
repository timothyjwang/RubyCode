# Testing what happend in do-each's; inspired during working on game of Go Fish.

fluffy_kittens = ["cute", "adorable", "fluffy"]
stuff_about_fluffy_kittens = []

puts "Fluffy kittens: #{fluffy_kittens.join(", ")}."
puts "Stuff about fluffy kittens: #{stuff_about_fluffy_kittens.join(", ")}."
puts

fluffy_kittens.each do |attribute|
	if attribute.include?("e")
		stuff_about_fluffy_kittens << fluffy_kittens.delete(attribute)
	end
end

puts "Fluffy kittens: #{fluffy_kittens.join(", ")}."
puts "Stuff about fluffy kittens: #{stuff_about_fluffy_kittens.join(", ")}."

puts

# Second round...

fluffy_kittens = ["cute", "adorable", "fluffy"]
stuff_about_fluffy_kittens = []
increments = 0

puts "Fluffy kittens: #{fluffy_kittens.join(", ")}."
puts "Stuff about fluffy kittens: #{stuff_about_fluffy_kittens.join(", ")}."
puts

fluffy_kittens.each do |attribute|
	if attribute.include?("e")
		stuff_about_fluffy_kittens << fluffy_kittens.delete(attribute)
		increments += 1
	end
end

puts "Fluffy kittens: #{fluffy_kittens.join(", ")}."
puts "Stuff about fluffy kittens: #{stuff_about_fluffy_kittens.join(", ")}."
puts "Increments: #{increments}."

puts

# Third round...

fluffy_kittens = ["cute", "adorable", "fluffy"]
stuff_about_fluffy_kittens = []
x = 0

puts "Fluffy kittens: #{fluffy_kittens.join(", ")}."
puts "Stuff about fluffy kittens: #{stuff_about_fluffy_kittens.join(", ")}."
puts

until fluffy_kittens[x] == nil
	if fluffy_kittens[x].include?("e")
		stuff_about_fluffy_kittens << fluffy_kittens.delete(fluffy_kittens[x])
	else
		x += 1
	end
end

puts "Fluffy kittens: #{fluffy_kittens.join(", ")}."
puts "Stuff about fluffy kittens: #{stuff_about_fluffy_kittens.join(", ")}."
