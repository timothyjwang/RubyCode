# Step 1 - Create a deck with 52 cards
card_suits = [" of Diamonds", " of Clubs", " of Hearts", " of Spades"]
card_values = ["Ace", 2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King"]
def populate_deck(card_suits, card_values)
	deck = []
	@card_suit = card_suits
	@card_value = card_values

	x = 0	# card_suits index
	y = 0	# card_values index

	while deck.length < 52
		until y == 13
			if @card_value.is_a?(Integer) == false
				deck.push(@card_value[y].to_s + @card_suit[x])
				y += 1
			else
				deck.push(@card_value[y] + @card_suit[x])
				y += 1
			end
		end
		y = 0
		x += 1
	end
	deck
end

# deck, unshuffled
deck = populate_deck(card_suits, card_values)

# Step 2 - "Shuffle" (randomize) it
shuffled_deck = deck.sort_by{rand}

# Step 3 - Once shuffled, deal 2 cards to player
deck_index = 0
players_hand = []
players_hand.push(shuffled_deck[deck_index])
deck_index += 1
players_hand.push(shuffled_deck[deck_index])
deck_index += 1

# Method definitions
def get_chomp_down
	input = gets.chomp.downcase
end

def hit_or_stay
	puts "Hit, or stay?"
end

# 5/17/2012
# The hand-scoring is not yet working properly
# My first test yielded a Queen of Hearts (10), and a 10 of Diamonds
# It properly told me that the total score was 20 (or so I thought...)
# Then, on a "hit", I got a 3 of Diamonds, but was told the total score was 30
# Another "hit" added a 4 of Diamonds, and was told the total score was 40
# One last "hit" yielded a 5 of Diamonds, and was told the total score was 50

# On a second test, I got a 4 of Diamonds, and a Queen of Diamonds (10)
# I was told my score was 20 - I exited out of the test at this point.

# It seems the score is being incremented by 10 per card added
# Meaning the .include?("Jack"/"Queen"/"King") part is not functioning properly
# It thinks everything is a 10...



# 5/18/2012
# Huzzah! The scoring seems to be working, now...
# First test, a 9 of Hearts and a 9 of Spades - was told the score was 18. Awesome!
# Did a "hit" - added a 3 of Diamonds. Was told the score was 21.  Swoot!

# Second test - 7 of Clubs + 3 of Hearts, score of 10. "Hit" added a 3 of Diamonds. Score = 13.
# The next few "hits" added a 4 of D, 5 of D and 6 of D; the score updated to 17, 22 and 28, respectively.
# Scoring seems to be updating properly...but it's odd that I wound up with a 3 -> 4 -> 5 -> 6 of Diamonds,
# in succession.  The next few hits resulted in:
# 7 of D (s = 35), 8 of D (s = 43), 9 of D (s = 52), 10 of D (s = 62), J of D (s = 72), Q of D (s = 82),
# K of D (s = 92), and lastly, an Ace of Clubs (s = 93).
# As the score went from 92 -> 93, the Ace-scoring portion is (somewhat) functional...

# Still, I notice that it cycled through where it "started" off at in the Diamonds suit, then moved onto
# the Clubs suit (as appropriate, given the decks original construction).

# So the next problem is...the hit_loop is not properly
# adding the next card in the sequence from the shuffled deck.

def tell_player_cards_in_hand(players_hand)
	x = 0
	players_hand = players_hand
	while x < players_hand.length
		puts players_hand[x]
		x += 1
	end

	# Scoring the hand
	hand_score = 0
	x = 0
	while x < players_hand.length
		# Scoring Jacks, Queens and Kings
		if players_hand[x].include?("Jack") || players_hand[x].include?("Queen") || players_hand[x].include?("King")
			hand_score += 10
			x += 1
		# Scoring Aces
		elsif players_hand[x].include?("Ace")
			if hand_score < 21
				hand_score += 11 unless ((hand_score + 11) > 21)
				x += 1
			else
				hand_score += 1
				x += 1
			end
		# Scoring everything else
		else
			# Strip everything but the numbers from the string
			hand_score += players_hand[x].gsub(/[^0-9]/, '').to_i
			x += 1
		end
	end
	# return hand_score here
	puts "The value of the cards in your hand is #{hand_score}."
end

def hit_loop(shuffled_deck, deck_index, players_hand)
	shuffled_deck = shuffled_deck
	deck_index = deck_index
	players_hand = players_hand

	hit_or_stay
	until get_chomp_down == "stay"
		players_hand.push(shuffled_deck[deck_index])
		deck_index += 1
		tell_player_cards_in_hand(players_hand)
		hit_or_stay
	end
	players_hand
end

# Step 4a - Ask "hit" or "stay"
puts "You have been dealt two cards.  In your hand, you have:"
tell_player_cards_in_hand(players_hand)

final_hand = hit_loop(deck, deck_index, players_hand)











# if dealer is <= 15, they hit (but that's for later)
