def word_translate(str)
    count = 0
    vowels = ['a', 'e', 'i', 'o', 'u']
    if vowels.include?str[0]
        res = str + "ay"
    else
        while !vowels.include?str[count] do
            count +=1
        end
        if str[count-1] == "q" 
            count +=1
        end
        res = str[count..str.length-1] + str[0..count-1] + "ay"
    end
    if(str.capitalize == str)
        return res.capitalize
    else
        return res
    end
end

def translate(str)
   words = str.split(" ")
   res = []
   for i in 0..words.length-1
     res.push(word_translate(words[i]))
   end
   return res.join(" ")
end