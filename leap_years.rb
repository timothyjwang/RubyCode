# Deaf leap-years,
# as in chapter 7, exercise 5 of Chris Pine's book, Learn to Progran

puts "Give a starting year:"
starting_year = gets.chomp.to_i
puts "Give an ending year:"
ending_year = gets.chomp.to_i

if starting_year > ending_year
	puts "Error: starting year > ending year - exiting."
	exit 0
end

puts	# blank space

year_range = []
put_year_into_range = starting_year
until year_range.last == ending_year
	year_range.push(put_year_into_range)
	put_year_into_range += 1
end

year_range.each do |year|
	puts year if year % 4 == 0
end

puts	# blank space

# 100's divisible by 4; == leap years?
# def times_four
# 	num = 4
# 	current_num = num

# 	until current_num == 100
# 		current_num += 1

# 		if current_num % 4 == 0
# 		  puts current_num
# 		end
# 	end
# end

# times_four
