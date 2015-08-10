class Board
  attr_accessor :grid
  attr_reader :count
  def initialize(grid = Board.default_grid)
    @grid = grid
    @count = 0
  end
  
  def [](*key)
    @grid[key[0][0]][key[0][1]]
  end
  
  def []=(*key,value)
    @grid[key[0]][key[1]] = value
  end
  
  def count
    (0..@grid.length-1).each do |row|
      (0..@grid[0].length-1).each do |col|
        @count +=1 if @grid[row][col] == :s
      end
    end
    @count
  end
  
  def self.default_grid 
    Array.new(10){Array.new(10)}
  end
  
  def empty?(pos = [])
    if pos.empty?  
      return count == 0
    else
      @grid[pos[0]][pos[1]].nil?
    end
  end
  
  def place_random_ship
    if full?
      raise "Board is full!"
    else
      available = []
      @grid.each_with_index do |row, row_ind|
        row.each_with_index do |col, col_ind|
          available.push([row_ind,col_ind]) if empty?([row_ind, col_ind])
        end
      end
      ship = available[rand(available.length-1)]
      @grid[ship[0]][ship[1]] = :s
    end
  end
  def full?
    count == @grid.length*@grid[0].length
  end
  def won?
    empty?
  end
  
end
