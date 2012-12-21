def string_shuffler(this_string)
	puts "#{this_string.split('').shuffle!.join}"
end

puts "Enter a string to shuffle."
shuffle_this_string = gets.chomp

string_shuffler(shuffle_this_string)
