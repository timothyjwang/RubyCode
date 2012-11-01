# Play with the basics of the ERB class.
# Following information from:
	# http://ruby-doc.org/stdlib-1.9.3/libdoc/erb/rdoc/ERB.html

require 'erb'

x = 42
template = ERB.new <<-EOF
	The value of x is <%= x %>
EOF

puts template.result(binding)

# One thing to note in the above example, indentation is considered for the output.
puts ""
# Without indentation:
template = ERB.new <<-EOF
The value of x is <%= x %>
EOF

puts template.result(binding)
