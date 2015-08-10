class BattleshipGame
  attr_reader :board, :player
  
  def initialize(player,board)
    @board = board
    @player = player
  end
  
  def attack(pos)
    @board[pos[0],pos[1]] = :x
  end
  
  def count
    @board.count
  end
  
  def game_over?
    @board.won?
  end
  
  def play_turn
    attack(@player.get_play)
  end
end
