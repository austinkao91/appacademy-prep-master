class Board
  attr_reader :grid, :length, :width, :winner
  def initialize(grid = Array.new(3){Array.new(3)}, length = 3, width = 3)
    @length = length
    @width = width
    @grid = grid
    @winner = nil
  end
  
  def empty?(pos)
		@grid[pos[0]][pos[1]] == nil
  end
  
  def place_mark(pos,mark)
    if @grid[pos[0]][pos[1]].nil?
      @grid[pos[0]][pos[1]] = mark
			@winner = mark if won?(pos,mark)
			return true
    else
      return false
    end
  end
  
  def won?(pos,mark)
    hor_check?(pos,mark) || vert_check?(pos, mark) || diag_check?(pos,mark)
  end
  
  def over?
    return true if @winner !=nil
    @grid.each do |row|
      row.each do |ele|
        return false if ele.nil?
      end
    end
  end
  
  def hor_check?(pos,mark)
    left = pos[0]-1
    right = pos[0]+1
    count = 1
    while( left >= 0 || right <3)
			if left >= 0
				count += 1 if @grid[left][pos[1]] == mark
				left -= 1
			end
			if right < 3
				count += 1 if @grid[right][pos[1]] == mark
				right += 1 
			end
    end
    count == 3 ? true : false
  end
  
  def vert_check?(pos,mark)
    top = pos[1]+1
    bottom = pos[1]-1
    count = 1
    while(bottom >= 0 || top <3)
      if top <3
				count += 1 if @grid[pos[0]][top] == mark
				top +=1 
      end

			if bottom >= 0
				count += 1 if @grid[pos[0]][bottom] == mark
				bottom -=1 
			end
    end
    count == 3 ? true : false
  end    
  
  def end_index?(num)
    num == 0 || num == @length-1
  end
      
  def diag_check?(pos,mark)
    return false unless end_index?(pos[0]) == end_index?(pos[1])
    (0..@length-1).each do |num|
      return false unless @grid[num][num] == mark || @grid[num][@length-1-num] == mark
    end
    return true
  end
end