# Testing blocks and procs,
# as in Chapter 14 of Chris Pine's Learn to Program book.

# Basic proc:
warning = Proc.new do
	puts "Look out! A random flying walrus!"
end

warning.call

puts	# blank space

# Giving a proc a block:
does_it_fly = Proc.new do |something_that_might_fly|
	puts "Look out! A random flying " + something_that_might_fly + "!"
end

does_it_fly.call 'hippopotamus'
does_it_fly.call 'cheese grater'

puts	# blank space

# Passing procs into methods:
def messages(some_proc)
	puts "You should see your proc.call below this line..."
	some_proc.call
	puts "..and above this line."
end

yummy = Proc.new do
	puts "    peanut-butter-and-jelly waffles"
end

messages yummy

puts	# blank space

# A method that has a 50/50 chance of calling the proc:
def maybe_do(some_proc)
	if rand(2) == 0
		some_proc.call
	end
end

puts "Of these 3 calls, you may/may not see your peanut-butter-and-jelly waffle."
puts "First call:"
call_number_one = maybe_do(yummy)
puts "Second call:"
call_number_two = maybe_do(yummy)
puts "Third call:"
call_number_three = maybe_do(yummy)

puts	# blank space

# A method that calls the proc twice:
def twice_do(some_proc)
	2.times do some_proc.call
	end
end

twice_do(yummy)

puts	# blank space

def do_until_false(first_input, some_proc)
	input = first_input
	output = first_input

	while output
		input = output
		output = some_proc.call input
	end

	input
end

build_array_of_squares = Proc.new do |array|
	last_number = array.last
	if last_number <= 0
		false
	else
		# Take off the last number...
		array.pop
		# ...and replace it with its square...
		array.push (last_number * last_number)
		# ...followed by the next smaller number.
		array.push (last_number - 1)
	end
end

always_false = Proc.new do |ignore_me|
	false
end

puts do_until_false([5], build_array_of_squares).inspect
# input = 5, output = 5; while output, input = output = 5, output = build_array_of_squares input;
	# last_number = 5; 5 * 5 = 25; [5] => [25]; array.push (last_number - 1), 5 => 4; [25] => [25, 4];
	# last_number = 4; 4 * 4 = 16; [25, 4] => [25, 16]; array.push (last_number - 1), 4 => 3; [25, 16] => [25, 16, 3];
	# etc, etc...until, finally, the end result is: [25, 16, 9, 4, 1, 0]
		# On line 71: output = some_proc.call input
			# This...-----------------------------^
			# ...is where we are passing in the first number in the array when calling build_array_of_squares
		# You can test this out: if you change the '5' on line 95 to a '6', you'll get [36, 25, 16, 9, 4, 1, 0]
	# It stops when the last number in the array == 0 (0 * 0 = 0)

yum = "lemonade"
puts do_until_false(yum, always_false)

puts	# blank space

# Methods that return procs:
def compose(proc1, proc2)
	Proc.new do |x|
		proc2.call(proc1.call(x))
	end
end

square_it = Proc.new do |x|
	x * x
end

double_it = Proc.new do |x|
	x * 2
end

double_then_square = compose(double_it, square_it)
square_then_double = compose(square_it, double_it)

puts double_then_square.call(5)
puts square_then_double.call(5)

puts	# blank space

# Passing blocks (not procs) into methods:
class Array
	def each_even(&was_a_block_now_a_proc)
	# ------------^
	# method parameters will ignore blocks, so slap an ampersand in front of the
	# block to change it to a proc.  Or remove the ampersand, run the program,
	# and watch a "wrong number of arguments" error message crop up...

		# Start with 'true' because
		# arrays start with 0, which is even
		is_even = true

		self.each do |object|
			if is_even
				was_a_block_now_a_proc.call object
			end

			# Toggle from even to odd, or vice versa
			is_even = !is_even
		end
	end
end

list_of_stuff = ['banana-and-walnut waffle', 'mud', 'awesome cherry pie', 'Celine Dion']
list_of_stuff.each_even do |stuff|
	puts "omNomnom, " + stuff + " vhas deeleeshus!"
end

[1, 2, 3, 4, 5].each_even do |odd_ball|
	puts odd_ball.to_s + " is not an even number."
end

puts	# blank space

def profile(block_description, &block)
	start_time = Time.now
	block.call
	duration = Time.now - start_time
	puts block_description + ': ' + duration.to_s + " seconds."
end

profile '25000 doublings' do
	number = 1
	25000.times do
		number += number
	end

	puts number.to_s.length.to_s + ' digits'
end

profile 'count to a million' do
	number = 0
	1000000.times do
		number += 1
	end
end

puts	# blank space

def grandfather_clock(chime)
	hours_gone_by_today = Time.new.hour
	puts "#{hours_gone_by_today} hours have passed by, today."
	major_hour = (hours_gone_by_today % 12)
	puts "The current major hour of the day is #{major_hour}."

	if major_hour == 0
		12.times do
			chime.call
		end
	else
		major_hour.times do
			chime.call
		end
	end
end

chime = Proc.new do
	puts "Bong!"
end

grandfather_clock(chime)
