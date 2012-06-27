# Blackjack.rb version 3.1

# Notes on progress / current problems:
  # Your hand contains: Jack of Clubs, Ace of Spades, Ace of Clubs.
  # Your hand value is 22.
  # You busted.
  # ^ Probably going to want to fix that...
  
    # Possible resolution: initially declare all Aces == 11, and then evaulate individually.
    # Example: Jack of Clubs, Ace of Spades, Ace of Clubs == 32.
    # Does it result in a bust? Yes. Does it contain an Ace? Yes.
    # Reduce the value of one Ace by 10. 32 => 22.
    # Does it result in a bust? Yes. Does it contain any Aces beyond the first? Yes.
    # Reduce the value of that second Ace by 10. 22 => 12.
    # Etc...

    # Playing around with a test file:
      # hand = ["Ace of Spades", "Ace of Hearts", "Ace of Clubs", "Ace of Diamonds", "Ten of Hearts", "Jack of Spades"]
      # score = 0

      # number_of_aces = hand.count { |card| card.include?("Ace") }

      # number_of_aces.times do
      #   score += 11
      # end

      # score += 10
      # score += 10

      # if score > 21 && number_of_aces >= 1
      #   until number_of_aces == 0
      #     score -= 10
      #     number_of_aces -= 1
      #   end  
      # end

      # puts "The score is #{score}."
      # puts "That's too much!" if score > 21

    # In it's current state, not working:
      # Care to play a round of blackjack? You have 200 credits.
      # yes
      # How many credits would you like to wager?
      # 25
      # You have been dealt two cards: Queen of Diamonds, Queen of Hearts.
      # The dealer has been dealt two cards, and is showing 3 of Clubs.
      # Hit, or stay?
      # stay
      # The dealer adds a Ace of Diamonds to their hand.
      # The dealer adds a 9 of Clubs to their hand.
      # The dealer adds a 9 of Hearts to their hand.
      # The dealer adds a 7 of Spades to their hand.
      # This round, the dealer's hand contained: Ace of Spades, 3 of Clubs, Ace of Diamonds, 9 of Clubs, 9 of Hearts, 7 of Spades.
      # It's a push.  Your 25 credit bid has been returned.
      # Care to play a round of blackjack? You have 200 credits.
    # Ace + 3 (11 + 3) = 14; they are dealt Ace of Diamonds. 14 => 15; they are dealt 9 of Clubs. 15 => 24.
    # (should have) re-evaluated to 1 + 3 + 1 + 9 = 14; dealt 9 of Hearts. 14 => 23.  Should have busted at this point.
    # Yet still, they were able to add a 7 (= 30), and it was considered a push (20 = 20).

    # Looking at it differently (as to how it could have wound up == 20):
    # Ace 3 + = 14, + Ace = 15, + 9 = 24, => 14, + 9 = 23, => 13, + 7 = 20.
    # Problem is riiiiight here...--------------------^      ^
    # -------------------------------------------------------|

    # After removing part of += value to hand_score (that tells whether to add 1 or 11 with aces):
      # Care to play a round of blackjack? You have 200 credits.
      # yes
      # How many credits would you like to wager?
      # 25
      # You have been dealt two cards: 4 of Clubs, Ace of Clubs.
      # The dealer has been dealt two cards, and is showing 2 of Spades.
      # Hit, or stay?
      # hit
      # Your hand contains 4 of Clubs, Ace of Clubs, Queen of Spades.
      # Hit, or stay?
      # hit
      # Your hand contains 4 of Clubs, Ace of Clubs, Queen of Spades, 5 of Spades.
      # Hit, or stay?
      # stay
      # The dealer adds a Ace of Spades to their hand.
      # The dealer adds a 7 of Spades to their hand.
      # The dealer adds a 5 of Hearts to their hand.
      # Your 20 whomps the dealer's meager 16.
      # This round, the dealer's hand contained: Ace of Diamonds, 2 of Spades, Ace of Spades, 7 of Spades, 5 of Hearts.
      # You started with 200 credits, and your bid was 25.
      # Winning doubled your bid, and earned you 50 credits.
      # Care to play a round of blackjack? You have 250 credits.
    # 11 + 2 = 13, + 11 = 24; => 14 => 4; + 7 = 11, + 5 = 16.
    # Above is what I assume the program went through to arrive at 16, because the hand could have equaled 21:
    # 11 (Ace of Diamonds) + 2 (of Spades) = 13, + 11 (Ace of Spades), arrive at 24.  Deduct 10, = 14. + 7 of Spades.

    # Because it didn't arrive at 21, I am led to believe that all aces are being taken into consideration at once
    # (not doing one at a time, and then stopping if necessary).

  def round_of_blackjack(player_credits, player_bid)
    player_credits = player_credits
    player_bid = player_bid

    card_suits = [" of Diamonds", " of Clubs", " of Hearts", " of Spades"]
    card_values = ["Ace", 2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King"]
    def populate_deck(card_suits, card_values)
      deck = []
      @card_suit = card_suits
      @card_value = card_values

    x = 0 # card_suits index
    y = 0 # card_values index

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
  deck_index += 1
  deal_card(players_hand, shuffled_deck, deck_index)
  puts "You have been dealt two cards: #{players_hand.join(", ")}."
  deck_index += 1

  dealers_hand = []
  deal_card(dealers_hand, shuffled_deck, deck_index)
  deck_index += 1
  deal_card(dealers_hand, shuffled_deck, deck_index)
  deck_index += 1
  puts "The dealer has been dealt two cards, and is showing #{dealers_hand[1]}."

  def get_chomp_down
    input = gets.chomp.downcase
  end

  def hit_or_stay
    puts "Hit, or stay?"
  end

  def round_result(result, player_credits, player_bid, dealers_hand)
    result = result
    tell_dealers_hand = puts "This round, the dealer's hand contained: #{dealers_hand.join(", ")}."

    if result == "win"
      tell_dealers_hand
      puts "You started with #{player_credits} credits, and your bid was #{player_bid}."
      player_credits += (player_bid * 2)
      puts "Winning doubled your bid, and earned you #{(player_bid * 2)} credits."
      play_again(player_credits)
    elsif result == "lose"
      tell_dealers_hand
      puts "You lost your bid of #{player_bid} credits."
      player_credits -= player_bid
      play_again(player_credits)
    else
      tell_dealers_hand
      puts "It's a push.  Your #{player_bid} credit bid has been returned."
      play_again(player_credits)
    end
  end

  def tell_player_hand_and_score(players_hand)
    hand_value = evaluate_hand_score(players_hand)
    puts "Your hand contains: #{players_hand.join(", ")}."
    puts "Your hand value is #{hand_value}."
    hand_value
  end

  def hit_loop(shuffled_deck, deck_index, players_hand, player_credits, player_bid, dealers_hand)
    hit_or_stay
    until get_chomp_down == "stay"
      players_hand.push(shuffled_deck[deck_index])
      puts "Your hand contains #{players_hand.join(", ")}."
      deck_index += 1

      if evaluate_hand_score(players_hand) == 21
        # Break player out of until-loop when they hit towards 21
        puts "You have a score of 21 with: #{players_hand.join(", ")}."
        break
      else
        # Busting
        if evaluate_hand_score(players_hand) > 21
          puts "You busted."
          round_result("lose", player_credits, player_bid, dealers_hand)
        else
          hit_or_stay
        end
      end
    end
    players_hand
  end

  def evaluate_hand_score(players_hand)
    hand_score = 0
    x = 0       # indexing for the hand scoring, below
    while x < players_hand.length
      if players_hand[x].include?("Jack") || players_hand[x].include?("Queen") || players_hand[x].include?("King")
        hand_score += 10
        x += 1
      elsif players_hand[x].include?("Ace")
        hand_score += 11
        x += 1  
      elsif
        # Strip everything but the numbers from the string
        hand_score += players_hand[x].gsub(/[^0-9]/, '').to_i
        x += 1
      end
    end

    # Count the Aces
    number_of_aces = players_hand.count { |card| card.include?("Ace") }

    if hand_score > 21 && number_of_aces > 0
      until number_of_aces == 0
        hand_score -= 10
        number_of_aces -= 1
      end
    end

    hand_score
  end

  def is_blackjack(hand)
    x = 0     # Hand indexing
    has_jack = false
    has_ace = false

    while x < hand.length
      if hand[x].include?("Ace") == true
        has_ace = true
        x = hand.length
      else
        x += 1
      end
    end

    x = 0     # Reset x

    while x < hand.length
      if hand[x].include?("Jack") == true
        has_jack = true
        x = hand.length
      else
        x += 1
      end
    end

    if has_jack == true && has_ace == true && hand.length == 2
      true
    else
      false
    end
  end

  if evaluate_hand_score(players_hand) == 21
    # If player's initial hand == 21, they are not put into the hit_loop
    puts "You have a score of 21 with: #{players_hand.join(", ")}."
    players_final_hand = players_hand
  else
    # Player gets put into the hit_loop
    # Cards are dealt on "hit," a score is kept, and the final results are saved in players_final_hand
    players_final_hand = hit_loop(shuffled_deck, deck_index, players_hand, player_credits, player_bid, dealers_hand)
  end
  # Save score as an integer in players_score
  players_score = evaluate_hand_score(players_final_hand)
  # Determine if the player's hand is a blackjack
  player_has_blackjack = is_blackjack(players_final_hand)

  # The dealers turn
  # First off, update deck_index
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
    round_result("win", player_credits, player_bid, dealers_hand)
  end
  dealer_has_blackjack = is_blackjack(dealers_hand)

  # Final scoring
  # First, does anyone have a Blackjack?
  if player_has_blackjack == true || dealer_has_blackjack == true
    if player_has_blackjack == true && dealer_has_blackjack == false
      puts "Your Blackjack trumps the dealer."
      round_result("win", player_credits, player_bid, dealers_hand)
    elsif player_has_blackjack == false && dealer_has_blackjack == true
      puts "The dealer's Blackjack trumps your hand."
      round_result("lose", player_credits, player_bid, dealers_hand)
    elsif player_has_blackjack == true && dealer_has_blackjack == true
      puts "Both you and the dealer have a Blackjack."
      round_result("tie", player_credits, player_bid, dealers_hand)
    end

  # Second, if no Blackjacks are in anyone's hand:
elsif players_score > dealers_score
  puts "Your #{players_score} whomps the dealer's meager #{dealers_score}."
  round_result("win", player_credits, player_bid, dealers_hand)
elsif dealers_score > players_score
  puts "The dealer's #{dealers_score} eats your #{players_score} for breakfast."
  round_result("lose", player_credits, player_bid, dealers_hand)
else
  round_result("tie", player_credits, player_bid, dealers_hand)
end
end

player_credits = 150

def place_a_wage(player_credits)
  def repeat_wager_req(player_credits)
    puts "How many credits would you like to wager?"
    player_bid = gets.chomp.to_i
  end

  player_credits = player_credits

  player_bid = repeat_wager_req(player_credits)
  until player_bid > 0 && player_bid <= player_credits
    if player_bid < 1
      puts "You can't bid 0 or less!"
    elsif player_bid > player_credits
      puts "You can't bid more than you have!"
    end
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

    will_player_play = gets.chomp.downcase
    until will_player_play == "yes"
      if will_player_play == "no"
        puts "Alright then, another time!"
        exit 0
      else
        puts "Was expecting yes/no."
        will_player_play = gets.chomp.downcase
      end
    end

    player_credits = place_a_wage(player_credits)
  end 
end

play_again(player_credits)
