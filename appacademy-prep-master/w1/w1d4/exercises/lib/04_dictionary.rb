class Dictionary
  attr_reader :entries 
  
  def initialize
    @entries = {}
  end
  
  def add(input)
	  if(input.is_a?(Hash))
	    input.keys.each do |key|
		  @entries[key] = input[key]
		end
	  elsif(input.is_a?(String))
	    @entries[input] = nil
	  end
  end
  
  def keywords
    return @entries.keys.sort
  end
  
  def include?(key)
    return @entries.include?(key)
  end
  
  def find(str)
    @res = {}
    @entries.keys.each do |key|
      if(str == key[0...str.length])
        @res[key] = @entries[key]
      end
    end
    return @res
  end
  
  def printable
    @res = ''
    @entries.keys.sort.each_with_index do |key,index|
      if(index > 0)
        @res += "\n"
      end
      @res +=  "[" + key + "]" + " " + '"'+ @entries[key] +'"'
    end
    return @res
  end
end