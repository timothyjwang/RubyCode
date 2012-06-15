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

class Clock
  def initialize(x)
    @hour_range = []

    x.times do |i|
      @hour_range << i
    end

    @starting_hour = @hour_range.last
    @hour_now = @starting_hour
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

  # def next_hour
  #   @hour_now = @hour_range[ % @hour_range.length]
  #   puts @hour_now
  # end
end

five_hour_clock = Clock.new(5)
