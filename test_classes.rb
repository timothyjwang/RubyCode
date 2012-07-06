# Testing classes and instance variables,
# as in Chapter 13 of Chris Pine's Learn to Program book.

class Die
  def roll
    1 + rand(6)
  end
end

dice = [Die.new, Die.new]

dice.each do |die|
  puts die.roll
end

puts  # blank space

class Die
  def roll
    @num_showing = 1 + rand(6)
  end

  def showing
    @num_showing
  end
end

die = Die.new
die.roll
puts die.showing
puts die.showing
die.roll
puts die.showing
puts die.showing

puts  # blank space

puts "We should see nothing, here:"
puts Die.new.showing

puts  # blank space

# Following in the footsteps of the test on line 39, we can use "initialize"
# to set up a .roll for our Die object upon its creation
class Die
  def initialize
    roll
  end

  def roll
    @num_showing = 1 + rand(6)
  end

  def showing
    @num_showing
  end
end

puts "This time, however, we should see a number:" 
puts Die.new.showing

puts  # blank space

class Die
  def initialize
    roll
  end

  def roll
    @num_showing = 1 + rand(6)
  end

  def showing
    @num_showing
  end

  def cheat(cheat_num)
    # This will force num_showing to be whatever we want, within a sensible range (1-6)
    # Otherwise, we still get a randomly rolled number
    @num_showing = cheat_num if (cheat_num > 0 && cheat_num < 7) else showing
  end
end

puts "We can cheat for a 1:"
puts Die.new.cheat(1)
puts "...a 4:"
puts Die.new.cheat(4)
puts "...a 2:"
puts Die.new.cheat(2)
puts "...a 6:"
puts Die.new.cheat(6)

puts "Now to try some things out of the range."
puts "...a 0:"
puts Die.new.cheat(0)
puts "...a -4:"
puts Die.new.cheat(-4)
puts "...a 7:"
puts Die.new.cheat(7)
