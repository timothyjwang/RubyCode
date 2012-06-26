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
