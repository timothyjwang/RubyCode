# Start with some simple maths with .reduce
a = (1..4).reduce(:+)
# 1 + 2 = 3, + 3 = 6, + 4 = 10
puts a

a = (1..4).reduce(:-)
# 1 - 2 = -1, - 3 = -4, - 4 = -8
puts a

a = (1..4).reduce(:*)
# 1 * 2 = 2, * 3 = 6, * 4 = 24
puts a

puts



# Slightly more complex maths with .reduce - give a number to use as a starting place
a = (1..4).reduce(5, :+)
# 5 + 1 = 6, + 2 = 8, + 3 = 11, + 4 = 15
puts a

a = (1..4).reduce(15, :-)
# 15 - 1 = 14, - 2 = 12, - 3 = 9, - 4 = 5
puts a

a = (1..4).reduce(5, :*)
# 5 * 1 = 5, * 2 = 10, * 3 = 30, * 4 = 120
puts a

puts



# Maths with .inject
a = (1..4).inject { |sum, n| sum + n }
# sum = 1; sum += n; n = 2, sum += 2 (1 => 3); n = 3, sum += 3 (3 => 6); n = 4, sum += 4 (6 => 10)
puts a

a = (1..4).inject { |sum, n| sum - n }
# sum = 1; sum -= n; n = 2, sum -= 2 (1 => -1); n = 3, sum -= 3 (-1 => -4); n = 4, sum -= 4 (-4 => -8)
puts a

a = (1..4).inject { |sum, n| sum * n }
# sum = 1; sum *= n; n = 2, sum *= 2 (1 => 2); n = 3, sum *= 3 (2 => 6); n = 4, sum *= 4 (6 => 24)
puts a

puts



# Slightly more complex maths with .inject - give a number to use as a starting place
a = (1..4).inject(5) { |sum, n| sum * n }
# sum = 5; sum *= n; n = 1, sum *= 1 (5 => 5); n = 2, sum *= 2 (5 => 10);
# n = 3, sum *= 3 (10 => 30); n = 4, sum *= 4 (30 => 120)
puts a

puts



# Repurposing .inject
longest = %w(dog goat roflpotamus cheese).inject do |memo, word|
  memo.length > word.length ? memo : word
  # memo = (nothing); word = dog; is memo.length > word.length? if so, memo = memo, word = goat (otherwise, memo = word);
  # memo = (nothing).length, or 0, and word.length == dog.length == 3; memo is now = dog;
  # memo = dog.length, or 3; and word.length == goat.length == 4; memo is now = goat;
  # memo = goat.length, or 4; and word.length == roflpotamus.length == 11; memo is now = roflpotamus;
  # memo = roflpotamus.length, or 11; and word.length == cheese.length == 6; memo stays roflpotamus
end
puts "The longest is #{longest}."

puts



# Messing around with .any?
has_an_ace = ["Two of Spades", "Queen of Hearts", "Ace of Clubs"]
puts "There is an Ace." if has_an_ace.any? { |word| word.include?("Ace") } == true

doesnt_have_an_ace = ["Four of Clubs", "Ten of Diamonds", "Three of Hearts"]
puts "There are no Aces." if doesnt_have_an_ace.any? { |word| word.include?("Ace") } == false

puts



# Messing around with .count
hand_of_cards = ["Two of Hearts", "Ace of Spades"]
puts "There are #{hand_of_cards.count} cards in the hand."

hand_of_cards.push("Walrus of Cheese")
puts "We just added 'Walrus of Chese' to the hand. The hand now contains:"
puts hand_of_cards.join(", ")
puts "There are now #{hand_of_cards.count} cards in the hand."

# There is a "Two of Hearts in the hand:"
puts hand_of_cards.count("Two of Hearts")
# But there is nothing with "Two" in the hand:
puts hand_of_cards.count("Two")
# ...well, not this way, anyhow...

puts

# ...but if we were to try it this way:
puts hand_of_cards.count{ |x| x.include?("Two") }
# ...we have something with "Two" in it!
puts hand_of_cards.count{ |x| x.include?("Ace") }
# ...and something with "Ace" in it!
puts hand_of_cards.count{ |x| x.include?("Walrus") }
# ...and who the flipping heck has a "Walrus" in their hand of cards? Whatever, someone does, apparently!
puts hand_of_cards.count{ |x| x.include?("Porcupine") }
# However, sadly, they don't have a "Porcupine"...

puts

# Hey, how many e's are in the hand?
puts hand_of_cards.count{ |x| x.include?("e") }
# ...wait, what? 3? "Two of Hearts" has 1, "Ace of Spades" has 2, and "Walrus of Cheese" has 3...should be 6...
# Lets poke around a bit...
hand_of_cards = []
puts "Our hand is now empty." if hand_of_cards == []
# Alright, so hand_of_cards is empty...first, put that Two of Hearts back in:
hand_of_cards.push("Two of Hearts")
# ...and now check for the number of e's:
puts hand_of_cards.count{ |x| x.include?("e") }
# Okay, there is 1...now to put that Ace of Spades back in:
hand_of_cards.push("Ace of Spades")
# ...check for e's again:
puts hand_of_cards.count{ |x| x.include?("e") }
# Now there are 2. So either one of three things is happening:
# 1. Ruby is keeping track of the object with the largest number of e's in it,
# 2. Ruby is keeping track of the number of objects with any number of e's in it, or
# 3. Ruby is keeping track of the number of e's in the last object evaluated.
# Testing the latter, first, by adding something with no e's in it:
hand_of_cards.push("What is a roflpotamus?")
puts hand_of_cards.count{ |x| x.include?("e") }
# ...results in 2, which eliminates the latter (#3). Now, to add something with 1 e in it:
hand_of_cards.push("Umbrella")
puts hand_of_cards.count{ |x| x.include?("e") }
# ...which results in 3. This eliminates #1 as a possibility, as there is nothing with 3 e's in it. 
