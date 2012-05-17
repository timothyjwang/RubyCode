# Following a tutorial/example from:
# http://www.ruby-doc.org/docs/ProgrammingRuby/html/tut_classes.html

# Create a class:
class Song
	# Give it parameters for a song name, creating artist, and song duration
	def initialize(name, artist, duration)
		# Input parameters go into instance variables specifically for the created object
		@name = name
		@artist = artist
		@duration = duration
	end
end

# Testing with an object, song_a
song_a = Song.new("Bicylops", "Fleck", 260)
# Inspecting it yields our information, though in a somewhat unclear fashion
puts song_a.inspect
# to_s only returns the id
puts song_a.to_s

puts	# blank space

# Altering our Song class, as well as adjusting the behavior
# of to_s when used in conjunction with our Song class
class Song
	def to_s
		"Song: #{@name}--#{@artist} (#{@duration})"
	end
end

# Recreating our song_a to test with our reworked Song class
song_a = Song.new("Bicylops", "Fleck", 260)
# Note: the two lines, below, will return the same thing
puts song_a.inspect
puts song_a.to_s

puts	# blank space

# Inheritance

# "< Song" tells Ruby that KaraokeSong is a subclass of Song
# Song is a "superclass" of KaraokeSong
# Or, in a parent/child relationship point of view, KaraokeSong's parent is Song
class KaraokeSong < Song
	def initialize(name, artist, duration, lyrics)
		super(name, artist, duration)
		@lyrics = lyrics
	end
end

# Testing our new KaraokeSong
song_b = KaraokeSong.new("My Way", "Sinatra", 225, "And now the...")
puts song_b.to_s

puts	# blank space

# Although song_b was created directly through KaraokeSong, it still reads as though affected
# by our changes to to_s in the Song class.  This is because it IS being affected - a good sign
# that KaraokeSong is inheriting properly from its parent, Song.
# However, our lyrics are missing...

class KaraokeSong < Song
	def to_s
		super + " [#{@lyrics}]"
	end
end

# Testing our reworked KaraokeSong
song_b = KaraokeSong.new("My Way", "Sinatra", 225, "And now the...")
puts song_b.to_s

puts	# blank space

# Multiple Ancestors

class Song
	def name
		@name
	end
	def artist
		@artist
	end
	def duration
		@duration
	end
end

song_c = Song.new("Bicyops", "Fleck", 260)
puts song_c.artist
puts song_c.name
puts song_c.duration

puts	# blank space

# A much simpler way of doing the above
class Song
	attr_reader :name, :artist, :duration
end

# testing the simplified way.  Produces the same result as the version immediately above
song_d = Song.new("Bicyops", "Fleck", 260)
puts song_d.artist
puts song_d.name
puts song_d.duration
