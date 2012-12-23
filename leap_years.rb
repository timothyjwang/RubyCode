# leap_years,
# as in chapter 7, exercise 5 of Chris Pine's book, Learn to Progran

class Leap_Years
	def initialize
		@starting_year
		@ending_year
		@year_range = []
	end

	def query_year_range
		puts "Give a starting year:"
		@starting_year = gets.chomp.to_i
		puts "Give an ending year:"
		@ending_year = gets.chomp.to_i

		if @starting_year > @ending_year
			puts "Error: start year is greater than end year."
			query_year_range
		else

			puts 

			this_year = @starting_year
			until @year_range[-1] == @ending_year
				@year_range << this_year
				this_year += 1
			end

			@year_range.each do |year|
				puts year if year % 4 == 0
			end
		end
	end

end

Leap_Years.new.query_year_range
