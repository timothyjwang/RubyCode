# Version 1.1
# The program takes an input InThisKindOfFormat, and will turn it into a string in_this_kind_of_format.

# The user is prompted for an input - the input is saved in a variable:
puts "Please input the file to be renamed:"
rename_me = gets.chomp

CAPTURE_CAPITAL_REGEXP = /
(            (?# Start a capture group with an open parentheses)
[A-Z]        (?# Match any single character ranging from A to Z)
)            (?# Close the capture group so that the character will be captured)
/x

def rename_method str_to_rename
	new_filename = str_to_rename.gsub CAPTURE_CAPITAL_REGEXP do |matched_capital|
	matched_capital.prepend("_").downcase
end

new_filename.gsub! /^_/, ""

puts "Is '#{new_filename}' the naming convention you were looking for?"
if gets.chomp.downcase == "yes"
	File.rename(str_to_rename, new_filename) # Renaming the file
	puts "Alrighty - the file name is now #{new_filename}."
else
	puts "No changes have been made."
	exit 0
end
end

rename_method rename_me
