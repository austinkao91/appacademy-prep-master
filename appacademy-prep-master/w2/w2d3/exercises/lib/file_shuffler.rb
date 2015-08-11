file_name = gets.chomp
file_lines = []
File.open(file_name).each do |f|
  file_lines.push(f)
end
shuffled_file = file_lines.shuffle
new_file_name = "#{file_name}-shuffled.txt"
File.open(new_file_name, 'w') do |file|
	file.puts shuffled_file
end