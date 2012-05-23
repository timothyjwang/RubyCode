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
# Will eventually remove the two lines, beloew - for now, it helps with keeping track of what
# cards will be dealt to the player & dealer during testing
puts "The first four cards in shuffled_deck are:"
puts "#{shuffled_deck[0..5]}"

def reevaluate_deck_index(players_hand)
	x = players_hand.length
end

# Step 3 - Once shuffled, deal 2 cards to player
# Note for later: use players_hand.length to find/use the next index to push?
# Idea from the_dealers_turn section.
players_hand = []
deck_index = reevaluate_deck_index(players_hand)
players_hand.push(shuffled_deck[deck_index])
deck_index += 1 	# Want to replace this line with deck_index
players_hand.push(shuffled_deck[deck_index])
deck_index += 1 	# Want to replace this line with deck_index

# Method definitions
def get_chomp_down
	input = gets.chomp.downcase
end

def hit_or_stay
	puts "Hit, or stay?"
end

def tell_player_cards_in_hand(players_hand)
	x = 0
	players_hand = players_hand
	while x < players_hand.length
		puts players_hand[x]
		x += 1
	end
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

def evaluate_hand_score(players_hand)
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
			if (hand_score + 11) > 21
				hand_score += 1
			else
				hand_score += 11
			end 
			x += 1	
		# Scoring "standard" numbers (2 through 10)
		elsif
			# Strip everything but the numbers from the string
			hand_score += players_hand[x].gsub(/[^0-9]/, '').to_i
			x += 1
		end
	end
	hand_score
end

# Step 4a - Ask "hit" or "stay"
puts "You have been dealt two cards.  In your hand, you have:"
tell_player_cards_in_hand(players_hand)

# The player is put into the hit_loop - adding cards until they declare "stay"
# Save the player's hand in players_final_hand
players_final_hand = hit_loop(shuffled_deck, deck_index, players_hand)

# Tell the player the final score of their hand
hand_score = evaluate_hand_score(players_hand)

def the_dealers_turn(shuffled_deck, dealers_hand, players_final_hand)
	# Find the index for shuffled deck using players_final_hand.length
	# + dealers_hand.length
	x = (players_final_hand.length + dealers_hand.length)
	shuffled_deck = shuffled_deck
	dealers_hand = dealers_hand
	dealers_hand_value = evaluate_hand_score(dealers_hand)

	# if dealer is <= 15, they hit
	until dealers_hand_value > 15
		dealers_hand.push(shuffled_deck[x])
		dealers_hand_value
	end
end

# Determine if the player busted:
puts "The value of the cards in your hand is #{hand_score}."
if (hand_score > 21)
	puts "Your score is over 21 - you busted."
	exit 0
else
	# If not, move on to the dealer's game:
	dealers_hand = []
	# Find the index for shuffled deck using players_final_hand.length
	x = players_final_hand.length
	dealers_hand.push(shuffled_deck[x])
	x += 1
	puts "The dealer's hand contains #{dealers_hand}"
	dealers_hand.push(shuffled_deck[x])
	x += 1
	puts "The dealer's hand contains #{dealers_hand}"

	dealers_final_hand = the_dealers_turn(shuffled_deck, dealers_hand, players_final_hand)
end





# Note:
# the_dealers_turn not working
# (Line 134)
# If the dealers_hand_value > 15, it stops, as appropriate
# But if dealers_hand_value <= 15, it stops, stuck in an infinite loop, expecting something

# The same problem (above) occurs if line 134 is completely removed

# (On line 134) If dealers_hand_value is replaced with dealers_hand_value = evaluate_hand_score(dealers_hand)
# The program will stop even if the value is < 15









