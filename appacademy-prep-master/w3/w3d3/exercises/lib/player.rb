class HumanPlayer
  def display(grid)
    puts grid.inspect
  end
  
  def get_play
    puts "Where?"
    move = gets.scan(/[0-9]/)
    [move[0].to_i,move[1].to_i]
  end
end
