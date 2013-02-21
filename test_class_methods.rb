class Car
	def color
		# this method is instance-level
		:this_car_is_red
	end
end

def Car.color
	# this method is class-level
	:this_car_is_gray
end

# since classes are objects, you can define singleton methods on them too
puts "Gray car" if Car.color == :this_car_is_gray

# class methods are independent of instance methods
sporty = Car.new
puts "This sporty car is red" if sporty.color == :this_car_is_red
puts "Gray car" if Car.color == :this_car_is_gray
