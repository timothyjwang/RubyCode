div_five = (1..100).find_all { |x| x % 5 == 0 }
puts div_five.join(", ")

puts

hand = ["Ace of Spades", "Four of Spades", "Ace of Hearts", "Ace of Diamonds", "Ten of Hearts", "Three of Diamonds", "Ace of Clubs"]
join_me = hand.find_all { |card| card.include?("Ace") }
puts join_me.join(", ")

puts

origin = ["Ace of Clubs", "Ace of Diamonds", "Ace of Hearts", "Ace of Spades"]
destination = []

# ...?

puts "Origin: #{origin}."
puts "Destination: #{destination}."
