class Code
  attr_reader :pegs
  PEGS = {:r => "red", :b => "blue", :g => "green", :y => "yellow", :o => "orange", :p => "purple"}
  def initialize(pegs)
    @pegs = pegs
  end
  def self.random
    arr = []
    colors = ['r','b','g','y','o','p']
    rng = Random.new
    4.times {arr.push(colors[rng.rand(colors.length-1)])}
    Code.new(arr)
  end
  
  def [](key)
		@pegs[key]
  end
	
  def self.parse(str)
    arr =[]
    colors = ['r','b','g','y','o','p']
    str.strip.downcase.scan(/[a-z]/).each {|color| arr.push(color)}
    arr.each {|color| raise "Not a color!" unless colors.include? color}
    Code.new(arr)
  end
  
  def exact_matches(code)
    count = 0
    (0..@pegs.length-1).each {|num| count +=1 if @pegs[num] == code[num]}
    count
  end
  
  def ==(code)
    return false unless code.is_a? Code
    (0..@pegs.length-1).each {|num|return false unless @pegs[num] == code[num]}
    return true
  end
  
  def near_matches(code)
    h = Hash.new(0)
    count = 0
    @pegs.each {|color1| h[color1] += 1 }
    (0..@pegs.length-1).each do |num|
      color2 = code[num]
      if h.has_key?(color2) && h[color2] > 0
        h[color2] -= 1
        count += 1 if @pegs[num] != code[num]
      end
    end
    count
  end
end

class Game
  attr_reader :secret_code
  
  def initialize(code = Code.random)
    @secret_code = code
  end
  
  def get_guess
    puts "Guess the code:"
    begin
      Code.parse(gets.chomp)
    rescue
      puts "Error parsing code!"
      retry
    end
  end
  
  def display_matches(code)
    puts "#{@secret_code.exact_matches(code)} exact matches"
    puts "#{@secret_code.near_matches(code)} near matches"
  end
end
