# Version 0.1
# Similar to inputs_alphabetizer.rb - takes inputs, and shuffles them into a random order.

puts "Add some stuff to shuffle.  When you are finished, enter a blank space."
shuffle_me = []
big_ass_prompt = "How would you like your list?\n1: On individual lines?\n...or...\n2: All one one line, separated by commas?"
run_me = 1

while run_me == 1
	user_input = gets.chomp.to_s
	if user_input != ""
		shuffle_me.push user_input
	else
		puts "Is that all?"
		if gets.chomp.to_s.downcase == "yes"
			shuffle_me.sort_by!{rand}
			
			puts "All done shuffling."
			puts big_ass_prompt
			user_sorting_choice = gets.chomp.to_s
			
			until user_sorting_choice == "1" || user_sorting_choice == "2"
				puts "" # Blank space
				puts "Input error: expecting either a 1 or a 2."
				puts big_ass_prompt
				user_sorting_choice = gets.chomp.to_s
			end
			if user_sorting_choice == "1"
				puts shuffle_me
				exit 0
			elsif user_sorting_choice == "2"
				puts shuffle_me.join(', ')
				exit 0
			end
		else
			# Anything but "yes" will have the while loop continue to re-run
		end
	end
end
