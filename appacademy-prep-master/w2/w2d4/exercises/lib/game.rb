require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
    attr_reader :board, :current_player
    
    def initialize(player_one, player_two)
        @board = Board.new
        @player = [player_one , player_two]
        @mark = [:X, :O]
        @turn = 0
    end
    
    def play_turn
        @board.place_mark(current_player.get_move, @mark[@turn])
        switch_players!
    end
    def current_player
        @current_player = @player[@turn]
    end
    def switch_players!
        @turn = @turn == 0 ? 1 : 0
    end
end
