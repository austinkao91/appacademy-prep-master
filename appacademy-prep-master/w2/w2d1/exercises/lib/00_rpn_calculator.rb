class RPNCalculator
  attr_reader :value
  
  def initialize
    @value = 0
    @stack = []
  end
  
  def push(num)
    @stack.push(num)
  end
  
  def plus
    raise "calculator is empty" if @stack.length < 2 
    a = @stack.pop()
    b = @stack.pop()
    @value = a + b
    @stack.push(@value)
  end
  
  def times
    raise "calculator is empty" if @stack.length < 2 
    a = @stack.pop()
    b = @stack.pop()
    @value = a * b
    @stack.push(@value)
  end
  
  def minus
    raise "calculator is empty" if @stack.length < 2 
    a = @stack.pop()
    b = @stack.pop()
    @value = b - a
    @stack.push(@value)
  end
  
  def divide
    raise "calculator is empty" if @stack.length < 2 
    a = @stack.pop()
    b = @stack.pop()
    @value = b/a.to_f
    @stack.push(@value)
  end
    
  def tokens(str)
    arr = []
    str.each_char do |char|
      if(char.to_i.to_s == char)
        arr.push(char.to_i)
      elsif(char == "+" || char == "-" || char == "/" || char == "*")
          arr.push(char.to_sym)
      end
    end
    return arr
  end
  
  def evaluate(str)
   arr = self.tokens(str)
   arr.each do |var|
     if(var.is_a?(Numeric))
       self.push(var)
     elsif(var.to_s == "+")
       self.plus
     elsif(var.to_s == "-")
       self.minus
     elsif(var.to_s == "*")
       self.times
     elsif(var.to_s == "/")
       self.divide
     end
   end
   return @value
  end
end

if __FILE__ == $PROGRAM_NAME
  calc = RPNCalculator.new
  if ARGV.empty?
    input = gets.chomp
    expression = ""
    while(input != "")
      expression = "#{expression} #{input}"
      input = gets.chomp
    end
    puts calc.evaluate(expression)
  else
    file_name = ARGV[0]
    File.open(file_name).each do |f|
      puts calc.evaluate(f)
    end
  end
end