# As per http://www.ruby-doc.org/core-1.9.3/Symbol.html
	# "...The same Symbol object will be created for a given name or string for the duration of a program's execution,
	# regardless of the context or meaning of that name. Thus if Fred is a constant in one context,
	# a method in another, and a class in a third, the Symbol :Fred will be the same object in all three contexts."

module One
	class Fred
	end
	# :Fred as a class
	$f1 = :Fred
end

module Two
	Fred = 1
	# :Fred as a constant
	$f2 = :Fred
end

def Fred()
end
# :Fred as a method
$f3 = :Fred

p $f1.object_id
p $f2.object_id
p $f3.object_id



puts



# Symbols as hash keys
red_apple   = { :color => "ruby red", :sourness => "none"          }
green_apple = { :color => "green",    :sourness => "slightly sour" }

puts

# Can call .keys to get a list of all the keys within a hash
puts "red_apple keys:   #{red_apple.keys}    green_apple keys: #{green_apple.keys}"
# Likewise, call .values to get a list of all the values within a hash
puts "red_apple values: #{red_apple.values}   green_apple keys: #{green_apple.values}"

# As .keys and .values return arrays, those arrays can be joined with .join():
# puts "red_apple keys:   #{red_apple.keys.join(', ')}   green_apple keys: #{green_apple.keys.join(', ')}"
# puts "red_apple keys:   #{red_apple.values.join(', ')}    green_apple keys: #{green_apple.values.join(', ')}"

puts

# Can call keys by their name (:color or :sourness) to return the value associated with that key:
puts "red_apple color: #{red_apple[:color]}   red_apple sourness: #{red_apple[:sourness]}"
puts "green_apple color: #{green_apple[:color]}    green_apple sourness: #{green_apple[:sourness]}"
# Note that keys are called as you might call indices of an array - via square brackets

puts

# Note that calling the key returns the value associated with that key - the object_id associated with that value will change...
puts "red_apple[:color].object_id == green_apple[:color].object_id ...?"
puts "  #{red_apple[:color].object_id == green_apple[:color].object_id}: #{red_apple[:color].object_id} != #{green_apple[:color].object_id}"
puts "red_apple[:sourness].object_id == green_apple[:sourness].object_id ...?"
puts "  #{red_apple[:sourness].object_id == green_apple[:sourness].object_id}: #{red_apple[:sourness].object_id} != #{green_apple[:sourness].object_id}"

puts

# ...however, the object_id of the keys are the same, across different hashes, or key-value pairs (provided those keys have the same name):
puts "red_apple.keys[0].object_id == green_apple.keys[0].object_id ...?"
puts "  #{red_apple.keys[0].object_id == green_apple.keys[0].object_id}: #{red_apple.keys[0].object_id} == #{green_apple.keys[0].object_id}"
puts "red_apple.keys[1].object_id == green_apple.keys[1].object_id ...?"
puts "  #{red_apple.keys[1].object_id == green_apple.keys[1].object_id}: #{red_apple.keys[1].object_id} == #{green_apple.keys[1].object_id}"



puts



# Can convert symbols to strings...
	# ...and slice as such
puts "#{:the_name_of_some_symbol}"
puts "  [0, 5]: #{:the_name_of_some_symbol.to_s[0, 5]}"
puts "  [7, 12]: #{:the_name_of_some_symbol.to_s[7, 12]}"
	# ...discern its length...
puts "Has a length of:"
puts "  #{:the_name_of_some_symbol.to_s.length}"
	# ...or its size...
puts "Has a size of:"
puts "  #{:the_name_of_some_symbol.to_s.size}"



puts



:this_symbol_is_not_empty
puts ":this_symbol_is_not_empty.empty? == true ...?"
puts "  #{:this_symbol_is_not_empty.empty?}"
puts ":this_symbol_is_not_empty.to_s"
puts "  #{:this_symbol_is_not_empty.to_s}"
