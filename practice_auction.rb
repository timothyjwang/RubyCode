class AuctionItem
	def initialize(item_name, starting_bid)
		@item_name = item_name
		@starting_bid = starting_bid

		@current_top_bid = 0
		@bid_history = {}
	end

	def call_current_item
		puts "#{@item_name}"
		puts "  Starting bid: #{@starting_bid}"
		puts "  Current bid:  #{@current_top_bid}"
	end

	def call_item_name
		@item_name
	end

	def call_current_top_bid
		@current_top_bid
	end

	def call_history
		@bid_history
	end

	def add_bid(bid)
		this_bid = Hash[*bid.flatten]

		if this_bid.keys[0] > @current_top_bid
			@bid_history = @bid_history.merge(this_bid)

			@current_top_bid = this_bid.keys[0]
		else
			puts "Fault: cannot add your bid of #{this_bid.keys[0]}, because it is lss than the current top bid of #{@current_top_bid}."
		end

	end
end

green_chair = AuctionItem.new("Green Chair", 475)
green_chair.call_current_item
puts "Bid history: #{green_chair.call_history}"

puts

green_chair.add_bid([500 => Time.now])
puts "Bid history:     #{green_chair.call_history}"
puts "Current top bid: #{green_chair.call_current_top_bid}"

puts

green_chair.add_bid([600 => Time.now])
puts "Bid history:     #{green_chair.call_history}"
puts "Current top bid: #{green_chair.call_current_top_bid}"

puts

green_chair.add_bid(65 => Time.now)
puts "Bid history:     #{green_chair.call_history}"
puts "Current top bid: #{green_chair.call_current_top_bid}"
