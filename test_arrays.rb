# objects in arrays are numbered from index 0:
names = ["Bob", "Joe", "Waffles!"]
puts "First, we should see Bob:"
puts names[0]
puts "Now we should se Joe:"
puts names[1]
puts "Lastly, who wants some Waffles?"
puts names[2]
puts ""
puts "If we ask for something that doesn't exist (ie, out of range), we should get nothing:"
puts names[3]

puts

# we can create a variable that is an empty array...
types_of_waffles = []
# ...and then populate it:
types_of_waffles[2] = "White-chocolate-chip and blueberry"
types_of_waffles[0] = "Whole-wheat and banana"
types_of_waffles[1] = "Buttermilk"
puts types_of_waffles

puts

# we can also change them...
types_of_waffles[1] = "Sardine and horse radish"
puts types_of_waffles

puts

# Regarding the usage of the Method, "Each":
fruits = ["bananas", "strawberries", "mangos"]
fruits.each do |fruit|
	puts "I sure to love to eat " + fruit + "."
end
# This essentially goes through the array, doing somthing to *each* something *in* the array

puts 

# let's look at .to_s and .join
veggies = ["Broccoli", "Carrots", "Bell Peppers"]
# this first one should list each object on an individual line:
puts veggies
# this one should appear as an array
puts veggies.to_s
# does not put out an array, as in the second case (above), but instead lists the contents, and separates
# them with commas.  Also, they are all on the same line, together, instead of each having their own
# line (see first case, above)
puts veggies.join(', ')
# Note that the above one does not add a comma after the last item in the array - the last item is not
# considered.  If you want to add something after the final item in the array:
puts veggies.join(' :) ') + ' 8)'

puts 

# Now to look at .push, .pop and .last
# push and pop are opposites, as + and - are opposites
# push adds an object to the end of the array:
puts veggies.to_s
veggies.push "Onions"
puts veggies.to_s

puts 

# pop removes the last object from the array:
puts veggies.to_s
veggies.pop
puts veggies.to_s

puts 

# and finally, last does not affect the array - it just tells us what is the last item in the array
puts veggies.last
veggies.push "Onions"
puts veggies.last

puts

some_array = %w[a b c d e f g]
puts "some_array: #{some_array.join(", ")}"
puts some_array[-3, 2].join(", ")
# The reason this gives us "e, f", is because: while -3 tells Ruby where to start looking in the array
# (the -3th index, or "e"), the next number (2) tells Ruby the length of what we want returned (meaning,
# "2" has nothing to do with the index ).

puts

a1 = ["red", "green", "blue"]
a2 = ["a", "b", "c"]
a3 = [1, 2, 3]
a_combi = [a1, a2, a3]
puts a_combi.join(", ")

# .assoc looks through an array of arrays, looking at each sub-array, and testing to see if the first
# element in the sub-array matches the given object to look for:
puts a_combi.assoc(1).join(", ")
puts a_combi.assoc("a").join(", ")
puts a_combi.assoc("red").join(", ")

# The following, however, will all result in "nil" - even though each of the three sub-arrays contain
# the requested object (2, "blue" and "b", respectively), the fact that they are not the *first*
# element in the array means they are not found. And so, nil is returned.
# puts a_combi.assoc(2).join(", ")
# puts a_combi.assoc("blue").join(", ")
# puts a_combi.assoc("b").join(", ")

puts

# Here's some interesting stuff - regarding using %w to create an array:
a1 = %w[red green blue]
a2 = %w[a b c]
a3 = %w[1 2 3]
a_combi = [a1, a2, a3]
puts a_combi.join(", ")
# This first one will result in "nil" - the other two, however, return the appropriate array:
# puts a_combi.assoc(1).join(", ")
puts a_combi.assoc("a").join(", ")
puts a_combi.assoc("red").join(", ")
# %w does NOT make [1 2 3] into [1, 2, 3]...
# it DOES, however, make ["1", "2", "3"] - testing it:
puts a_combi.assoc("1").join(", ")
# And now it is found - huzzah!  No nil.

puts

# Playing around with multiple arrays that start with a given element:
a1 = %w[orange banana cactus]
a2 = %w[leemur hippo kitten]
a3 = %w[orange roflsaurus cheeseburger]
a_combi = [a1, a2, a3]
puts a_combi.join(", ")
puts a_combi.assoc("orange").join(", ")
# The array 'a1' is returned, as it is the first array (found) that starts with the given element (orange).

puts

# Using the previous example (lines 126-133):
puts a_combi.assoc("orange") == a1
# We see that the array is returned, as the above returns true. However...
puts a_combi.assoc("orange").join(", ") == a1
# ...this one returns false - note the usage of .join.

puts

# .collect - essentially an each-do for modifying all elements in an array:
a1 = %w[a d ez]
puts a1.collect { |x| x + "cheeseburger" }.join(", ")
puts a1.join(", ")
# Above, no permanent alterations. Below, permanent alterations:
puts a1.collect! { |x| x + "cheeseburger" }.join(", ")
puts a1.join(", ")

puts
