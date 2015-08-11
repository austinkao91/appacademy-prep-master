class Hangman
  attr_reader :guesser, :referee, :board
  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
  end
  
  def setup
    word_length = @referee.pick_secret_word
    @guesser.register_secret_length(word_length)
    @board = Array.new(word_length)
  end
  
  def take_turn
    player_guess = @guesser.guess(@board)
    index = referee.check_guess(player_guess)
    update_board(player_guess,index)
    @guesser.handle_response(player_guess,index)
  end
  
  def update_board(player_guess,index)
    index.each {|num| @board[num] = player_guess}
  end
end

class HumanPlayer
end

class ComputerPlayer
  attr_reader :dictionary, :candidate_words
  def initialize(dictionary)
    @dictionary = dictionary
  end
  
  def register_secret_length(len)
    @candidate_words = @dictionary.select {|word| word.length == len}
  end
  
  def candidate_words
    @candidate_words
  end
  
  def pick_secret_word
    @secret_word = @dictionary[rand(@dictionary.length-1)]
    @secret_word.length
  end
  
  def check_guess(str)
    raise "Please enter a string" unless str.is_a? String
    indices = []
    (0..@secret_word.length-1).each do |index| 
      indices.push(index) if @secret_word[index] == str
    end
    indices
  end
  
  def guess(board)
    h = Hash.new(0)
    max = 0
    guess = ""
    guessed = Set.new
    board.each {|letter| guessed.add(letter) if !letter.nil? }
    @candidate_words.each do |words|
      words.each_char do |char|
        unless guessed.include?(char)
          h[char] +=1
          if h[char] > max
            max = h[char]
            guess = char 
          end
        end
      end
    end
    guess
  end
  
  def handle_response(letter, indices)
    @candidate_words.select!{|words| matches(words,letter) == indices}
  end
  
  def matches(word,str)
	  ind = []
	  (0..word.length-1).each {|i| ind.push(i) if word[i] == str}
	  ind
  end
end
