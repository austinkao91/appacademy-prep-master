
class TowersOfHanoi
  attr_reader :towers, :rod, :stack
  
  def initialize(stack = 3,rod = 3)
    @rod = rod
    @stack = stack
    @goal = (1..@stack).to_a.reverse
	  @towers = Array.new(@rod) {Array.new}
		@towers[0] = @goal.dup
  end
  
  def won?
    @towers[1..@rod-1].each {|stack| return true if stack == @goal}
    return false
  end
  
  def move(from, to)
    if valid_move?(from, to) 
      @towers[to].push(@towers[from].pop)
    else 
      puts "Invalide Move! Please reselect your towers\n"
    end
  end
  
  def valid_move?(from, to)
    if from == to
			puts "Cannot move to the same tower"
			return false
		end
    if from < 0 || from > @rod-1
				puts "From index out of bounds"
				return false
		end
    if to < 0 || to > @rod-1
			puts "To index out of bounds"
			return false
		end
    if @towers[from].length == 0 || @towers[to].length == @stack
			puts "From rod is empty or to rod is full"
			return false 
		end
    if @towers[to].length != 0
      if @towers[from].last > @towers[to].last
			  puts "Cannot move a larger stack on top of a smaller stack"
			  return false 
		  end
		end
    return true
  end
  
  def render
		puts @stack_height_index.inspect
		(0..@stack-1).to_a.reverse.each do |stack_index|
			line = ""
			@towers.each do |rod|
				line = " #{line} #{rod[stack_index] if rod[stack_index] != nil}#{ "|"if rod[stack_index] == nil} "
			end
			puts line
		end
  end
  
  def play
    while(!won?)
      render
      puts "Select from tower 0 to #{@rod-1}  to move from"
      from  = gets.to_i
      puts "Select from tower 0 to #{@rod-1}  to move to"
      to = gets.to_i
      move(from,to)
    end
    puts "Congratulations! You have won"
		render
	end
end
