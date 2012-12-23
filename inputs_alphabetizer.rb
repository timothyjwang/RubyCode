# Version 2.0

# Notes for next version:
# Consider putting in a way to allow users to copy/paste in lists (in a certain)
	# format) - and allow them to add onto it

# This program takes user inputs, puts them into an array,
# alphabetizes them, then outputs the alphabetized array.

class Inputs_Alphabetizer
	def initialize
		@alphabetize_me = []
		@big_ass_prompt = "How would you like your list?\n1: On individual lines?\n...or...\n2: All one one line, separated by commas?"
	end

	def get_alphabetizin
		puts "#{@big_ass_prompt}"
		
		user_sorting_choice = gets.chomp.to_i
		if user_sorting_choice == 1
			puts @alphabetize_me
			exit 0
		elsif user_sorting_choice == 2
			puts "#{@alphabetize_me.join(', ')}"
			exit 0
		else
			puts "Input error: expecting either a 1 or a 2."
			get_alphabetizin
		end
	end

	def add_to_array
		puts "Add some stuff to alphabetize.  When you are finished, enter a blank space."
		add_stuff
	end

	def end_adding_stuff
		puts "Are you finished adding stuff? (y/n)"
	
		user_response = gets.chomp.downcase
		if user_response == "y"
			@alphabetize_me.sort!
			get_alphabetizin
		else
			add_to_array
		end
	end

	def add_stuff
		this_thing = gets.chomp

		if this_thing != ""
			@alphabetize_me << this_thing
			add_stuff
		else
			end_adding_stuff
		end
	end

end

Inputs_Alphabetizer.new.add_to_array