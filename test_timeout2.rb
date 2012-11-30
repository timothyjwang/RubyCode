require "timeout"

# Second test:
# If user inputs "yum!" (without quotes) before time runs out, waffle_is_yummy == true.
# If anything else is input, waffle_is_yummy == false.

# Notes on use of rescue (line 21-24)
# Without rescue: if nothing is input, timer expires and error is thrown.  The program ends.
# By adding rescue: if the timer expires, above error is not thrown and a program continues on as normal.



begin
	waffle_is_yummy = Timeout::timeout(5) {
		puts "What do you have to say about that waffle?"
		if gets.chomp.downcase == "yum!"
			true
		else
			false
		end
	}
rescue
	# block of code goes here; ie:

	puts "Guess the waffle wasn't yummy enough. :("
end

puts waffle_is_yummy
