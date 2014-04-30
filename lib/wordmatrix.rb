require 'matrix'

class WordMatrix
	attr_accessor :table, :dictionary

	def initialize args
		@table = args[:table]
		@dictionary = args[:dictionary]
	end

	def is_valid_word? word
		table_contains?(word)
	end

	def is_prefix? prefix
		check_prefix prefix
	end

	def output_words
		output = []
		dictionary.each do |word|
			if is_valid_word?(word)
				output << word
			end
		end

		output

	end

	private



	def check_prefix prefix
		if is_prefix_full_word?(prefix)
			return false
		else
			table_contains? prefix
		end

	end


	def is_prefix_full_word? prefix

		if @dictionary.include?(prefix)
			return true
		else
			return false
		end

	end


	def table_contains? word

		word_array = word.split("")
		letter = word_array[0]

		position = contains_first_letter?(letter)

		if position == false
			return false
		end



		i = 1

		while i <= (word_array.size-1) do

			letter = word_array[i]
			dictionary_letters = dictionary_letters_at_position i
			
			unless dictionary_letters.include?(letter)
				return false
			end

			position = contains_adjacent_letter?(letter,position)

			if position == false
				return false
			end
			i += 1
		end

		return true

	end

	def contains_first_letter? letter
		first_letters = dictionary_letters_at_position 0
		unless first_letters.include?(letter)
			return false
		end


		j = 0
		k = 0


		while j < @table.column_count do

			while k < @table.row_count do

				if table[j,k] == letter	
					return [j,k]
				end
				k += 1
			end
			k = 0
			j += 1
		end


		return false
	end

	def contains_adjacent_letter? letter, position
		i = position[0]
		j = position[1]

		unless j == @table.column_count

			if @table[i,j+1] == letter
				return [i,j+1]
			end 
		end

		unless j == 0

			if @table[i,j-1] == letter
				return [i,j-1]
			end
		end
		
		unless i == @table.row_count

			if @table[i+1,j] == letter
				return [i+1,j]
			end
		end

		unless i == 0

			if  @table[i-1,j] == letter
				return [i-1,j]
			end
		end
		return false
	end

	def dictionary_letters_at_position i
		letters = []
		dictionary.each {|word| letters << word.split("")[i]}
		letters
	end

end