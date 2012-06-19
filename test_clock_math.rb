# # Badger x11 + Mushroom! x2
# class Clock
#   puts "How many rounds would you like to go through?"
#   ROUNDS = (gets.chomp.to_i * 13)

#   ROUNDS.times do |i|
#     puts "Badger," if (i % 13) < 11
#     puts "Mushroom!" if (i % 13) > 10
#   end
# end



# clock-math
# five_hour_clock = Clock.new(5)

# five_hour_clock.next_hour #=> 0
# five_hour_clock.next_hour #=> 1
# five_hour_clock.next_hour #=> 2

# five_hour_clock.reset!
# five_hour_clock.pass_time(16) #=> 1

# four_hour_clock = Clock.new(4)



class Clock_a
  def initialize(x)
    @hour_range = []

    x.times do |i|
      @hour_range << i
    end

    @starting_hour = @hour_range.last
    @hour_now = @starting_hour
  end

  def hour_range
    puts @hour_range.join(", ")
  end

  def hour_now
    puts @hour_now
  end

  def reset!
    puts (@hour_now = @starting_hour)
  end

  def pass_time(x)
    x.times do |i|
      @hour_now = @hour_range[i % @hour_range.length]
    end
  puts @hour_now
  end

  def next_hour
    x = 0
    until x == @hour_now
      x += 1
    end
    if @hour_now == (@hour_range.length - 1)
      @hour_now = @hour_range[0]
    else
      @hour_now = @hour_range[x + 1]
    end
    puts @hour_now
  end
end

# Possible change:
# As is, numbers get added starting from index 0 (a 5-hour-clock would be hours 0 - 4).
# This is because of line 31's @hour_range << i.
# If we wanted to do a 1-n range, change line 31 to read: @hour_range << (i + 1)
# On line 58, change: if @hour_now == (@hour_range.length - 1)
# ...to: if @hour_now == @hour_range.length
# AND on line 65, change: @hour_now = @hour_range[x + 1]
# ...to: @hour_now = @hour_range[x]
# Below:

class Clock_b
  def initialize(x)
    @hour_range = []

    x.times do |i|
      @hour_range << (i + 1)
    end

    @starting_hour = @hour_range.last
    @hour_now = @starting_hour
  end

  def hour_range
    puts @hour_range.join(", ")
  end

  def hour_now
    puts @hour_now
  end

  def reset!
    puts (@hour_now = @starting_hour)
  end

  def pass_time(x)
    x.times do |i|
      @hour_now = @hour_range[i % @hour_range.length]
    end
  puts @hour_now
  end

  def next_hour
    @hour_now = @hour_range[@hour_now % @hour_range.length]
    puts @hour_now
  end
end

five_hour_clock = Clock_b.new(5)
five_hour_clock.hour_range
five_hour_clock.hour_now
five_hour_clock.pass_time(4)
five_hour_clock.reset!
five_hour_clock.next_hour
five_hour_clock.next_hour
five_hour_clock.next_hour
five_hour_clock.next_hour
five_hour_clock.next_hour
