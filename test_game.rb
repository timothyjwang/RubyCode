# some_game v 0.0.1
# Some random game.



# Current notes/problems:
	# Will eventually split Player into it's own class, and various monsters into their own.


class The_Player
	def initialize
		@level = 1

		@current_health = 10
		@max_health = 10
		@current_mana = 10
		@max_mana = 10
		@strength = 1
		@intelligence = 1
		@endurance = 1

		@current_experience = 0
		@exp_to_next_level = (@level * 10)
	end

	def self.level
		@level
	end

	def self.current_health
		@current_health
	end
	def self.max_health
		@max_health
	end
	def self.current_mana
		@current_mana
	end
	def self.max_mana
		@max_mana
	end
	def self.strength
		@strength
	end
	def self.intelligence
		@intelligence
	end
	def self.endurance
		@endurance
	end

	def self.current_experience
		@current_experience
	end
	def self.exp_to_next_level
		@exp_to_next_level
	end

	def exp_after_battle(exp)
		if @current_experience >= @exp_to_next_level
			@level += 1
			puts "You've gained enough experience to advance to level #{@level}!"
	end
end

def main_prompt
	puts "What would you like to do?"
	puts "1. Visit the store.     2. Go whack some monsters.     3. Check stats."

	user_input = gets.chomp.to_i

	if user_input == 1
		puts "Visit the store."
	elsif user_input == 2
		monster_whacking_time
	elsif user_input == 3
		puts "You are level #{The_Player.level}, with #{The_Player.current_experience}/#{The_Player.exp_to_next_level} experience."
		puts "You have #{The_Player.current_health}/#{The_Player.max_health} health, and #{The_Player.current_mana}/#{The_Player.max_mana} mana."
		puts "You have #{The_Player.strength} strength, #{The_Player.intelligence} intelligence, and #{The_Player.endurance} endurance."
		main_prompt
	else
		puts "Was expecting an integer (1-3)."
		main_prompt
	end
end

def monster_whacking_time
	def monster_generator(diff)
		gen_num = (1 + rand(3))

		if diff == "wimpy"
			wimpy_monsters(gen_num)
		elsif diff == "regular"
			regular_monsters(gen_num)
		else
			challenging_monsters(gen_num)
		end
	end

	def wimpy_monsters(num)
		if num == 1
			puts "You encounter a Giant Rat!"
			puts "You kicked the Giant Rat's butt, earning you 10 experience!"
			The_Player.current_experience += 10
			main_prompt
		elsif num == 2
			puts "You encounter a Goblin!"
			puts "You kicked the Goblin's butt, earning you 10 experience!"
			The_Player.current_experience += 10
			main_prompt
		else
			puts "You encounter a Forlorn Ghost!"
			puts "You kicked the Forlorn Ghost's butt, earning you 10 experience!"
			The_Player.current_experience += 10
			main_prompt
		end
	end

	def regular_monsters(num)
		if num == 1
			puts "You encounter a Scorpion!"
		elsif num == 2
			puts "You encounter a Harpy!"
		else
			puts "You encounter an Angry Horse Hell-Bent On Avenging His Sister Who Was Sent To A Glue Factory!"
		end
	end

	def challenging_monsters(num)
		if num == 1
			puts "You encounter a Minotaur!"
		elsif num == 2
			puts "You encounter a Frost Dragon!"
		else
			puts "You encounter an Insurance Salesman!"
		end
	end

	puts "What kind of monsters are you looking for?"
	puts "1. Wimpy monsters.           2. Regular monsters."
	puts "3. Challenging monsters.     4. Return to town."

	user_input = gets.chomp.to_i

	if user_input == 1
		monster_generator("wimpy")
	elsif user_input == 2
		monster_generator("regular")
	elsif user_input == 3
		monster_generator("challenging")
	elsif user_input == 4
		main_prompt
	else
		puts "Was expecting an integer (1-4)."
		monster_whacking_time
	end
end

main_prompt