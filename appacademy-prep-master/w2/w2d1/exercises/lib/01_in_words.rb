class Fixnum
  @@hash_ones = {
      0 => "",
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine",
    }
  @@hash_tens = {
      0 => "",
      2 => "twenty",
      3 => "thirty",
      4 => "forty",
      5 => "fifty",
      6 => "sixty",
      7 => "seventy",
      8 => "eighty",
      9 => "ninety",
    }
		
  @@hash_one_tens = {
			0 => "ten",
			1 => "eleven",
			2 => "twelve",
			3 => "thirteen",
			4 => "fourteen",
			5 => "fifteen",
			6 => "sixteen",
			7 => "seventeen",
			8 => "eighteen",
			9 => "nineteen"
  }
  @@hash_places = {
			0 => "",
      1 => "thousand",
      2 => "million",
      3 => "billion",
      4 => "trillion"
    }
  def in_words
    digit_length = self.to_s.length
    digit_triples = (digit_length-1)/3
    digit_head = digit_length%3
    digit_pointer = 0
    if self == 0 
      words = "zero"
    else
			if digit_length == 3 
				words = "#{digit_blocks_to_words(self.to_s)}"
			elsif digit_head > 0
				words = "#{digit_blocks_to_words(self.to_s[0,digit_head])} #{@@hash_places[digit_triples]}".strip
				digit_triples -= 1 if digit_triples > 0 
			end
			truncated = self.to_s[digit_head,digit_length]			
      while digit_triples >= 0 && digit_length !=3
        digit_words = digit_blocks_to_words(truncated[digit_pointer..digit_pointer+2])
        words = "#{words} #{digit_words} #{@@hash_places[digit_triples] if digit_words != ""}" .strip
        digit_triples -= 1
        digit_pointer += 3
      end
    end
    words
  end
  
  private
  
  def digit_blocks_to_words(numStr)
    num = numStr.to_i
		digitLen = numStr.length
		
		if num > 99 
			num_to_words = "#{@@hash_ones[numStr[digitLen-3].to_i]} hundred"
    end
		
		if num > 9 && numStr[digitLen-2].to_i != 0 && numStr[digitLen-2].to_i != 1
			num_to_words = "#{num_to_words} #{@@hash_tens[numStr[digitLen-2].to_i]}" 
		end
    
    if num > 0 && digitLen > 1 && numStr[digitLen-2].to_i == 1
			num_to_words = "#{num_to_words} #{@@hash_one_tens[numStr[digitLen-1].to_i]}"
		else
			num_to_words = "#{num_to_words} #{@@hash_ones[numStr[digitLen-1].to_i]}"		
		end
		
		num_to_words.strip
  
  end
end