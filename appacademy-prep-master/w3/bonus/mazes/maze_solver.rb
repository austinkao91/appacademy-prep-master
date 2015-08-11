class Maze
  attr_reader :grid, :width, :start, :length
  def initialize(grid)
    @grid = grid
    @width = @grid.length-1
    @length = @grid[0].length-1
    @dist_grid = Array.new(@width+1){Array.new(@length+1,+1.0/0.0)}
    @marked = Array.new(@width+1){Array.new(@length+1,false)}
    @path = Array.new(@width+1){Array.new(@length+1)}
  end
  
  def solve
    find_path
        final = end_pos
    while @path[final[0]][final[1]] != final
      final = @path[final[0]][final[1]]
      @grid[final[0]][final[1]] = "X" unless @grid[final[0]][final[1]] == "S"
    end
    str = ""
    @grid.each do |line|
      str << line.join("")  
    end
    puts str
  end
  
  def debug
    puts "Error 1" unless @dist_grid.length == @grid.length
    puts "Error 2" unless @dist_grid[0].length == @grid[0].length
    puts "Error 3" unless @marked.length == @grid.length
    puts "Error 4" unless @marked[0].length == @grid[0].length
    (1..@width-1).each do |row|
      (1..@length-1).each do |col|
        puts "Error 5 #{[row,col].inspect}" unless bc([row,col])
      end
    end
    puts "Error 6" unless start_pos == [6,1]
    puts "Error 7" unless end_pos == [1,14]
    find_path
    final = end_pos
    while @path[final[0]][final[1]] != final
      final = @path[final[0]][final[1]]
      @grid[final[0]][final[1]] = "X" unless @grid[final[0]][final[1]] == "S"
    end
    render
  end
  
  def render
    str = ""
    @grid.each do |line|
      str << line.join("")  
    end
    puts str
  end
  
  def find_path
    @start = start_pos
    queue = [start]
    while !queue.empty?
      curr_pos = queue.shift
      @marked[curr_pos[0]][curr_pos[1]] = true
      curr_dist = @dist_grid[curr_pos[0]][curr_pos[1]]
      neighbors(curr_pos).each do |pos|
        unless @grid[pos[0]][pos[1]] == "*" || @grid[pos[0]][pos[1]] == "\n"
          dist = @dist_grid[pos[0]][pos[1]]
          
          if dist > curr_dist + 1
            @dist_grid[pos[0]][pos[1]] = curr_dist + 1
            @path[pos[0]][pos[1]] = curr_pos
          end
          
          unless @marked[pos[0]][pos[1]]
            queue.push(pos)
          end
        end
      end
    end
  end
  
  def start_pos
    @grid.each_with_index do |row,row_ind|
      row.each_with_index do |col, col_ind|
        if col == 'S'
          @path[row_ind][col_ind] = [row_ind,col_ind]
          @dist_grid[row_ind][col_ind] = 0
          return [row_ind,col_ind]
        end
      end
    end
  end
  
  def end_pos
    @grid.each_with_index do |row,row_ind|
      row.each_with_index do |col, col_ind|
        if col == 'E'
          return [row_ind,col_ind]
        end
      end
    end
  end
  
  def neighbors(pos)
    neighbor = []
    if bc([pos[0]+1, pos[1]])
      neighbor.push([pos[0]+1,pos[1]])
    end
    
    if bc([pos[0]-1, pos[1]])
      neighbor.push([pos[0]-1,pos[1]])
    end
    
    if bc([pos[0], pos[1]+1])
      neighbor.push([pos[0],pos[1]+1])
    end
    
    if bc([pos[0], pos[1]-1])
      neighbor.push([pos[0],pos[1]-1])
    end
    neighbor
  end
    
  def bc(pos)
    pos[0] > 0 && pos[0] < @width && pos[1] > 0 && pos[1] < @length
  end
end

if __FILE__ == $PROGRAM_NAME
  file_name = "maze1.txt"
  grid_lines = []
  maze_file = File.open(file_name)
  maze_file.each {|f| grid_lines.push(f.split(//))}
  maze_file.close
  maze = Maze.new(grid_lines)
  maze.solve
end