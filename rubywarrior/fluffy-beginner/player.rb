# RubyWarrior - Level 1
# class Player
# 	def play_turn(warrior)
	
# 		def walk(warrior)
# 			warrior.walk!
# 		end

# 		walk(warrior)
# 	end
# end



# RubyWarrior - Level 2
class Player
	def play_turn(warrior)
	
		def walk(warrior)
			warrior.walk!
		end

		def feel(warrior)
			warrior.feel.empty?
		end

		def attack(warrior)
			warrior.attack!
		end

		if feel(warrior)
			walk(warrior)
		else
			attack(warrior)
		end

	end
end
