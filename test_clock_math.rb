# # Badger x11 + Mushroom! x2
# class Clock
#   puts "How many rounds would you like to go through?"
#   ROUNDS = (gets.chomp.to_i * 13)

#   ROUNDS.times do |i|
#     puts "Badger," if (i % 13) < 11
#     puts "Mushroom!" if (i % 13) > 10
#   end
# end

class Clock_a
  attr_reader(:hour_range, :hour_now)

  def initialize(x)
    @hour_range = []

    x.times do |i|
      @hour_range << i
    end

    @starting_hour = @hour_range.last
    @hour_now = @starting_hour
  end

  def reset!
    @hour_now = @starting_hour
  end

  def pass_time(x)
    x.times do
      next_hour
    end
    @hour_now
  end

  def next_hour
    @hour_now = @hour_range[(@hour_now + 1) % @hour_range.length]
    @hour_now
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
  attr_reader(:hour_range, :hour_now)

  def initialize(x)
    @hour_range = []

    x.times do |i|
      @hour_range << (i + 1)
    end

    @starting_hour = @hour_range.last
    @hour_now = @starting_hour
  end

  def reset!
    @hour_now = @starting_hour
  end

  def pass_time(x)
    x.times do
      next_hour
    end
    @hour_now
  end

  def next_hour
    @hour_now = @hour_range[@hour_now % @hour_range.length]
    @hour_now
  end
end

# rspec test Clock_a
describe Clock_a do
  let(:five_hour_clock) { Clock_a.new(5) }

  it "puts the hour range." do
    five_hour_clock.hour_range.should == [0, 1, 2, 3, 4]
  end

  it "tells the current hour (begins @ last hour in the range: 4)." do
    five_hour_clock.hour_now.should == 4
  end

  it "goes to the next hour in the range (0)." do
    five_hour_clock.next_hour
    five_hour_clock.hour_now.should == 0
  end

  it "goes to the next hour in the range (1)." do
    five_hour_clock.next_hour
    five_hour_clock.next_hour
    five_hour_clock.hour_now.should == 1
  end

  it "resets the clock to the starting hour (4)." do
    five_hour_clock.next_hour
    five_hour_clock.next_hour
    five_hour_clock.reset!  
    five_hour_clock.hour_now.should == 4
  end

  it "uses pass_time to advance the hour 4 times." do
    five_hour_clock.pass_time(4).should == 3
  end
end

# rspec test Clock_b
describe Clock_b do
  let(:five_hour_clock) { Clock_b.new(5) }

  it "puts the hour range." do
    five_hour_clock.hour_range.should == [1, 2, 3, 4, 5]
  end

  it "tells the current hour (begins @ last hour in the range: 5)." do
    five_hour_clock.hour_now.should == 5
  end

  it "goes to the next hour in the range (1)." do
    five_hour_clock.next_hour
    five_hour_clock.hour_now.should == 1
  end

  it "goes to the next hour in the range (2)." do
    five_hour_clock.next_hour
    five_hour_clock.next_hour
    five_hour_clock.hour_now.should == 2
  end

  it "resets the clock to the starting hour (5)." do
    five_hour_clock.next_hour
    five_hour_clock.next_hour
    five_hour_clock.reset!  
    five_hour_clock.hour_now.should == 5
  end

  it "uses pass_time to advance the hour 4 times." do
    five_hour_clock.pass_time(4).should == 4
  end
end
