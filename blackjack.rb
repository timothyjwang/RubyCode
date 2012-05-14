# Step 1 - Create a deck with 52 cards
def populate_deck
	deck = []
	card_suits = ["Diamonds", "Clubs", "Hearts", "Spades"]
	card_values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
	
	x = 0	# card_suits index
	y = 0	# card_values index

	while deck.length < 52
		until y == 13
			deck.push(card_values[y] + " of " + card_suits[x])
			y += 1
		end
		y = 0
		x += 1
	end
	deck
end

deck = populate_deck

# Step 2 - "Shuffle" (randomize) it
deck.sort_by!{rand}

# Step 3 - Once shuffled, deal 2 cards to player
deck_index = 0
players_hand = []
players_hand.push(deck[deck_index])
deck_index += 1
players_hand.push(deck[deck_index])
deck_index += 1

# Method definitions
def get_chomp_down
	input = gets.chomp.downcase
end

def hit_or_stay
	puts "Hit, or stay?"
	puts "If you would like to view your hand, type 'cards'."
	get_chomp_down
end

def tell_player_cards_in_hand(players_hand)
	x = 0
	players_hand = players_hand
	while x < players_hand.length
		puts players_hand[x]
		x += 1
	end
end

# Step 4a - Ask "hit" or "stay"
until hit_or_stay == "hit" || hit_or_stay == "stay" || hit_or_stay == "cards"
	hit_or_stay
end






# if dealer is <= 15, they hit (but that's for later)
