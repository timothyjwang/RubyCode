# Deaf Grandma program,
# as in chapter 7, exercise 5 of Chris Pine's book, Learn to Progran

def def_grandma
#    ^
#    |
# HAHAAHAHAA! Get it? "def" grandma? Deaf? def?
# ...I'm sorry, that was terrible...
	bye_count = 0

	while 
		user_response = gets.chomp.to_s

		if (user_response != user_response.upcase)
			puts "HUH!?  SPEAK UP, SONNY!"
			bye_count = 0
		elsif (user_response == user_response.upcase) && (user_response != "BYE")
			random_year = rand(37) + 1927
			puts "NOT SINCE #{random_year}!"
			bye_count = 0
		elsif (user_response == "BYE")
			bye_count += 1
			puts "WHAT?"
			if bye_count == 3
				puts "SEE YOU LATER, SONNY!"
				exit 0
			end
		end
	end
end

puts "Ask Grandma any question. When you're done, be sure to say 'BYE'."
def_grandma
