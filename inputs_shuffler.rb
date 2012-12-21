# Version 2.0
# Ofshoot of inputs_alphabetizer.rb - takes inputs, and shuffles them into a random order.

class Inputs_Shuffler
	def initialize
		@shuffle_me = []
		@big_ass_prompt = "How would you like your list?\n1: On individual lines?\n...or...\n2: All one one line, separated by commas?"
	end

	def get_shufflin
		puts "#{@big_ass_prompt}"
		
		user_sorting_choice = gets.chomp.to_i
		if user_sorting_choice == 1
			puts @shuffle_me
			exit 0
		elsif user_sorting_choice == 2
			puts "#{@shuffle_me.join(', ')}"
			exit 0
		else
			puts "Input error: expecting either a 1 or a 2."
			get_shufflin
		end
	end

	def add_to_array
		puts "Add some stuff to shuffle.  When you are finished, enter a blank space."
		add_stuff
	end

	def end_adding_stuff
		puts "Are you finished adding stuff? (y/n)"
	
		user_response = gets.chomp.downcase
		if user_response == "y"
			@shuffle_me.shuffle!
			get_shufflin
		else
			add_to_array
		end
	end

	def add_stuff
		this_thing = gets.chomp

		if this_thing != ""
			@shuffle_me << this_thing
			add_stuff
		else
			end_adding_stuff
		end
	end

end

Inputs_Shuffler.new.add_to_array