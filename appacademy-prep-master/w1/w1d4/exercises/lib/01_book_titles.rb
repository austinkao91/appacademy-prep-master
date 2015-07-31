class Book
  # TODO: your code goes here!
	attr_accessor :title
	def title=(str)
		words = str.split(" ")
		result = []
		non_capitalized_words = {
			'a' => true,
			'of' => true, 
			'and' => true, 
			'in' => true, 
			'an' => true, 
			'the' => true, 
			'to' => true 
		}
		result[0] = words[0].capitalize
		words[1,words.length-1].each_with_index do |word,index|
			if non_capitalized_words.has_key?(word)	
				result[index+1] = word
			else
				result[index+1] = word.capitalize
			end
		end
		@title = result.join(" ")
	end
end
