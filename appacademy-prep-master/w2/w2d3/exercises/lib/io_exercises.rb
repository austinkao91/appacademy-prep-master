# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.
def guessing_game
  rng = Random.new
  num = 1 + rng.rand(100)
  won = false
  guess_count = 0
  while(!won)
    puts "guess a number"
    guess = gets.to_i
    guess_count += 1
    puts guess
    won = true if guess == num
    if guess > num
      puts "too high"
    else
      puts "too low"
    end
  end
  puts "You guessed the number in #{guess_count} tries. Congratulations you won!"
end

file_name = gets.chomp
file_lines = []
File.open(file_name) do |f|
  file_lines.push([f.gets.chomp])
end
puts file_lines.inspect
