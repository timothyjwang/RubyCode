# Step 1:
# Create a deck with 52 cards
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

# Step 2:
# "Shuffle" (randomize) it
deck.sort_by!{rand}

# Step 3:
# Once shuffled, deal 2 cards to player
players_hand = []
players_hand.push(deck[0]).push(deck[1])

# Step 4:
# Ask "hit" or "stay"
puts "Your hand contains a " + players_hand[0] + " and a " + players_hand[1]
puts "Hit, or Stay?"
	# deal card if "hit"











# if dealer is <= 15, they hit (but that's for later)
