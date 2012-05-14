# Create a deck with 52 cards
# shuffle it
deck = []
card_suits = ["Diamonds", "Clubs", "Hearts", "Spades"]
card_values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]

def add_card_to_deck
	x = 0	# card_suits index
	y = 0	# card_values index

	while deck.length < 52
		deck.push(card_values[y] + " of " + card_suits[x])
		until y == 13
			y += 1
			add_card_to_deck
		end

		y = 0
		x += 1
	end
end

add_card_to_deck
deck.sort_by!{rand}
puts deck

# # make all the below into a method:
# until deck.length == 13
# 	deck.push(card_values[y] + " of " + card_suits[x])
# 	y += 1
# end
# y = 0
# x += 1
# until deck.length == 26
# 	deck.push(card_values[y] + " of " + card_suits[x])
# 	y += 1
# end
# y = 0
# x += 1
# until deck.length == 39
# 	deck.push(card_values[y] + " of " + card_suits[x])
# 	y += 1
# end
# y = 0
# x += 1
# until deck.length == 52
# 	deck.push(card_values[y] + " of " + card_suits[x])
# 	y += 1
# end







# once shuffled, deal 2 cards to player
# ask "hit" or "stay"
	# deal card if "hit"











# if dealer is <= 15, they hit (but that's for later)
