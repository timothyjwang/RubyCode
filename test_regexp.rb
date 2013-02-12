# Practicing regular expressions

# Create a password-validation regex that checks for 7+ character length,
# and the presence of at least 1 alphabetical character,
# and the presence of at least 1 numerical character
def valid_password(password)
	if (password.length >= 7) && (password.match(/[A-z]/)) && (password.match(/[0-9]/))
		puts "true"
	else
		puts "false"
	end
end

test_password_1 = "short"
test_password_2 = "containslettersonly"
test_password_3 = "7777777"
test_password_4 = "scouter9001powerlever"
test_password_5 = "99redballoons"
test_password_6 = "1two3four"

puts ""

puts "is #{test_password_1} a valid password?"
valid_password(test_password_1)

puts ""

puts "is #{test_password_2} a valid password?"
valid_password(test_password_2)

puts ""

puts "is #{test_password_3} a valid password?"
valid_password(test_password_3)

puts ""

puts "is #{test_password_4} a valid password?"
valid_password(test_password_4)

puts ""

puts "is #{test_password_5} a valid password?"
valid_password(test_password_5)

puts ""

puts "is #{test_password_6} a valid password?"
valid_password(test_password_6)
