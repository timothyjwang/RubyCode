# Blackjack.rb version 1.4

# Notes on progress / current problems:
	# No severe problems (game-breaking bugs, or errors) encountered.
	# Program takes player's bid, and appropriately:
		# Deducts it, if the player loses.
		# Doubles it, and adds it to the player's credit-pool on a win.
			# (ie, 150 starting credits, bid of 25, win = (25*2), post-round credits = 200)
		# Makes no changes to player's credit-pool, and goes into another round on a tie.

	# Have not personally had the luck of encountering any blackjacks during testing,
		# Either by the player only, the dealer only, or both.  So, not sure if BJ's are working.
			# But everything else seems to be fine, so I don't see what could go wrong...		

def round_of_blackjack(player_credits, player_bid)
	player_credits = player_credits
	player_bid = player_bid

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

	deck = populate_deck(card_suits, card_values)
	shuffled_deck = deck.sort_by{rand}

	def deal_card(person, shuffled_deck, deck_index)
		person.push(shuffled_deck[deck_index])
	end

	deck_index = 0

	players_hand = []
	deal_card(players_hand, shuffled_deck, deck_index)
	puts "You have been dealt: #{shuffled_deck[deck_index]}."
	deck_index += 1
	deal_card(players_hand, shuffled_deck, deck_index)
	puts "You have been dealt: #{shuffled_deck[deck_index]}."
	deck_index += 1

	dealers_hand = []
	deal_card(dealers_hand, shuffled_deck, deck_index)
	deck_index += 1
	deal_card(dealers_hand, shuffled_deck, deck_index)
	deck_index += 1
	puts "The dealer has been dealt two cards."
	puts "The dealer is showing: #{dealers_hand[1]}."

	def get_chomp_down
		input = gets.chomp.downcase
	end

	def hit_or_stay
		puts "Hit, or stay?"
	end

	# Results
	def round_result(result, player_credits, player_bid)
		result = result

		if result == "win"
			puts "You started with #{player_credits} credits, and your bid was #{player_bid}."
			player_credits += (player_bid * 2)
			puts "Winning doubled your bid."
			play_again(player_credits)
		elsif result == "lose"
			puts "You lost your bid of #{player_bid} credits."
			player_credits -= player_bid
			play_again(player_credits)
		else
			puts "It's a tie.  Your bid has been returned."
			play_again(player_credits)
		end
	end

	def tell_player_hand_and_score(players_hand)
		puts "Your hand contains: #{players_hand}."
		puts "Your hand value is #{evaluate_hand_score(players_hand)}."
		hand_value = evaluate_hand_score(players_hand)
		hand_value
	end

	def hit_loop(shuffled_deck, deck_index, players_hand, player_credits, player_bid)
		shuffled_deck = shuffled_deck
		deck_index = deck_index
		players_hand = players_hand

		hit_or_stay
		until get_chomp_down == "stay"
			players_hand.push(shuffled_deck[deck_index])
			deck_index += 1
					
			# Busted?
			# The following if/else will not return busted if score = 21 (as appropriate).
			# Player can still choose to "hit." Incorporate anti-stupidity net by 
			# automatically stopping if the score == 21?
			busted = tell_player_hand_and_score(players_hand)
			if busted > 21
				puts "You busted."
				round_result("lose", player_credits, player_bid)
			else
				hit_or_stay
			end
		end
		players_hand
	end

	def evaluate_hand_score(players_hand)
		# First off, determine if the hand contains an Ace.
		# If so, remove it from the array, and .push it to the last place.
		y = 0        # indexing for the Ace-checking
		while y < players_hand.length
			if players_hand[y].include?("Ace")
				players_hand.push(players_hand.delete_at(y))
				y += 1
			else
				y += 1
			end
		end

		hand_score = 0
		x = 0       # indexing for the hand scoring, below
		while x < players_hand.length
			if players_hand[x].include?("Jack") || players_hand[x].include?("Queen") || players_hand[x].include?("King")
				hand_score += 10
				x += 1
			elsif players_hand[x].include?("Ace")
				if (hand_score + 11) > 21
					hand_score += 1
				else
					hand_score += 11
				end 
				x += 1	
			elsif
				# Strip everything but the numbers from the string
				hand_score += players_hand[x].gsub(/[^0-9]/, '').to_i
				x += 1
			end
		end
		hand_score
	end

	def is_blackjack(hand_in_question)
		if hand_in_question.include?("Ace") && hand_in_question.include?("Jack")
			true
		else
			false
		end
	end

	# Player gets put into the hit_loop
	# Cards are dealt on "hit," a score is kept, and the final results are saved in players_final_hand
	# Also, save it out to an integer in players_score
	players_final_hand = hit_loop(shuffled_deck, deck_index, players_hand, player_credits, player_bid)
	players_score = evaluate_hand_score(players_final_hand)
	player_has_blackjack = is_blackjack(players_final_hand)

	# The dealers turn
	# First off, update deck_index to be the sum of dealers_hand + however many cards are in players_final_hand
	deck_index = players_final_hand.length + dealers_hand.length

	# Until the value of dealers_hand > 15, they hit
	until evaluate_hand_score(dealers_hand) > 15
		dealers_hand.push(shuffled_deck[deck_index])
		puts "The dealer adds a #{shuffled_deck[deck_index]} to their hand."
		deck_index += 1
	end
	dealers_score = evaluate_hand_score(dealers_hand)
	# The dealer busts if over 21
	if dealers_score > 21
		puts "The dealer busts with #{dealers_score}."
		round_result("win", player_credits, player_bid)
	end
	dealer_has_blackjack = is_blackjack(dealers_hand)

	# Final scoring
	# First, does anyone have a Blackjack?
	if player_has_blackjack == true || dealer_has_blackjack == true
		# If one has a blackjack, and the other does not, it's an insta-win.
		if player_has_blackjack == true && dealer_has_blackjack == false
			puts "Your Blackjack trumps the dealer's #{dealers_hand}."
			round_result("win", player_credits, player_bid)
		elsif player_has_blackjack == false && dealer_has_blackjack == true
			puts "The dealer's Blackjack trumps your #{players_final_hand}."
			round_result("lose", player_credits, player_bid)
		elsif player_has_blackjack == true && dealer_has_blackjack == true
			puts "Both you and the dealer have a Blackjack."
			round_result("tie", player_credits, player_bid)
		end

	# Second, if no Blackjacks are in anyone's hand:
	elsif players_score > dealers_score
		puts "Your #{players_score} whomps the dealer's meager #{dealers_score}."
		round_result("win", player_credits, player_bid)
	elsif dealers_score > players_score
		puts "The dealer's #{dealers_score} eats your #{players_score} for breakfast."
		round_result("lose", player_credits, player_bid)
	else
		round_result("tie", player_credits, player_bid)
	end
end

# Wager system:
player_credits = 150

def place_a_wage(player_credits)

	def repeat_wager_req(player_credits)
		puts "How many credits would you like to wager?"
		player_bid = gets.chomp.to_i
	end

	player_credits = player_credits

	player_bid = repeat_wager_req(player_credits)
	until player_bid > 0 && player_bid <= player_credits
		player_bid = repeat_wager_req(player_credits)
	end
	
	round_of_blackjack_results = round_of_blackjack(player_credits, player_bid)
end

def play_again(player_credits)
	if player_credits == 0
		puts "You've run out of credits."
		exit 0
	else
		puts "Care to play a round of blackjack? You have #{player_credits} credits."
		if gets.chomp.downcase == "yes"
			player_credits = place_a_wage(player_credits)
		else
			puts "Alright then, another time!"
			exit 0
		end
	end	
end

play_again(player_credits)
