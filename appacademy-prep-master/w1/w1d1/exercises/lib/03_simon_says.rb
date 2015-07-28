def echo(str)
	return str
end

def shout(str)
	str.upcase
end

def repeat(str, a=2)
	count = 2
	res = str
	while count <= a do
		count +=1
		res += " #{str}"
	end
	res
end

def start_of_word(str,a)
	str[0..a-1]
end

def first_word(str)
	res = ""
	str.split(" ")[0]
end
	
def titleize(str) 
    words_no_cap = ["and", "or", "the", "over", "to", "the", "a", "but"]
    words = str.split(" ")
    words[0].capitalize!
    for i in 1..words.length-1
      if(!words_no_cap.include?words[i])
         words[i].capitalize!
      end
    end
    return words.join(" ")
end