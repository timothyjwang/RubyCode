# Playing with find_all

div_five = (1..100).find_all { |x| x % 5 == 0 }
puts div_five.join(", ")

puts

hand = ["Ace of Spades", "Four of Spades", "Ace of Hearts", "Ace of Diamonds", "Ten of Hearts", "Three of Diamonds", "Ace of Clubs"]
join_me = hand.find_all { |card| card.include?("Ace") }
puts join_me.join(", ")

puts

origin = hand
destination = []

all_the_things = origin.find_all { |card| card.include?("Ace") }
all_the_things.each do |card_a|
	origin.each do |card_b|
		origin.delete(card_b) if card_b == card_a
	end
end

until all_the_things.length == 0
	destination << all_the_things.delete(all_the_things[0])
end

puts "Origin: #{origin}."
puts "Destination: #{destination}."
puts "All The Things: #{all_the_things}."

puts

# Playing with select

hand = ["Ace of Spades", "Four of Spades", "Ace of Hearts", "Ace of Diamonds", "Ten of Hearts", "Three of Diamonds", "Ace of Clubs"]
select_all_aces = hand.select { |x| x =~ /(Ace)/ } .join(", ")
puts "The hand: #{hand}."
puts "Selecting aces only: #{select_all_aces}."
puts "The hand again: #{hand}."

puts

# As expected, using select! alters the original hand
hand = ["Ace of Spades", "Four of Spades", "Ace of Hearts", "Ace of Diamonds", "Ten of Hearts", "Three of Diamonds", "Ace of Clubs"]
select_all_aces = hand.select! { |x| x =~ /(Ace)/ } .join(", ")
puts "The hand: #{hand}."
puts "Selecting aces only: #{select_all_aces}."

puts

# Alternatively, we can use reject to refuse any non-Ace
hand = ["Ace of Spades", "Four of Spades", "Ace of Hearts", "Ace of Diamonds", "Ten of Hearts", "Three of Diamonds", "Ace of Clubs"]
select_all_aces = hand.reject { |x| x.include?("Ace") != true } .join(", ")
puts "The hand: #{hand}."
puts "Selecting aces only: #{select_all_aces}."
puts "The hand again: #{hand}."

puts

# And reject! alters the original hand
hand = ["Ace of Spades", "Four of Spades", "Ace of Hearts", "Ace of Diamonds", "Ten of Hearts", "Three of Diamonds", "Ace of Clubs"]
select_all_aces = hand.reject! { |x| x.include?("Ace") != true } .join(", ")
puts "The hand: #{hand}."
puts "Selecting aces only: #{select_all_aces}."
