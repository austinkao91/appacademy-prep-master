class ComputerPlayer
  
  attr_reader  :name, :board
  attr_accessor :mark
  
  def initialize(name)
    @name = name
  end
  
  def display(board)
    @board = board
  end
  
  def get_move
    available = []
    @board.grid.each_with_index do |row, row_ind|
      row.each_with_index do |col, col_ind|
        available.push [row_ind, col_ind] if @board.grid[row_ind][col_ind].nil?
        return [row_ind,col_ind] if @board.won?([row_ind,col_ind],@mark)
      end
    end
    rng = Random.new
    rng.rand(available.length-1)
  end
end
