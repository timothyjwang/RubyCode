require "timeout"

# First test:
# If user inputs "yum!" (without quotes) before time runs out, waffle_is_yummy == true.
# If anything else is input, waffle_is_yummy == false.
# If nothing is input, timer expires and error is thrown.

waffle_is_yummy = Timeout::timeout(5) {
	if gets.chomp.downcase == "yum!"
		true
	else
		false
	end
}

puts waffle_is_yummy
