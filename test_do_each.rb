# Testing what happend in do-each's; inspired during working on game of Go Fish.

fluffy_kittens = ["cute", "adorable", "fluffy"]
stuff_about_fluffy_kittens = []

fluffy_kittens.each do |attribute|
	if attribute.include?("e")
		stuff_about_fluffy_kittens << fluffy_kittens.delete(attribute)
	end
end

puts fluffy_kittens.join(", ")
puts stuff_about_fluffy_kittens.join(", ")
