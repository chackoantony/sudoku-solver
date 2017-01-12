class SudokuSolver
    
  attr_accessor :input
    
  def initialize(input)
    @input = input
  end 

  #Method to find blank(0) position
  def find_empty_position
    @input.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        return [i,j] if cell == 0
      end
    end
    return nil      
  end

  #Check if the value is already present in the row elements
  def row_eligible?(i, val)
    !@input[i].include?(val)
  end

  #Check if the value is already present in the column elements
  def col_eligible?(j, val)
    !@input.collect { |row| row[j] }.include?(val)
  end

  #Check if the value is already present in the box elements
  def box_eligible?(i, j, val)
    row = i/3 * 3
    col = j/3 * 3
    3.times do |i|
      3.times do |j|
        return false if @input[row + i][col + j] == val
      end
    end
    return true     
  end

  #Check if the value can be inserted at the given position
  def can_insert?(i,j, val)
    row_eligible?(i, val) && col_eligible?(j, val) && box_eligible?(i, j, val)
  end 

  #Solve sudoku based on backtrace algorithm
  def solve
    row, col = find_empty_position
    return true unless row  #Solution found
    (1..9).each do |val|
      if can_insert?(row, col, val)
        @input[row][col] = val
        return true if solve #call solve method recursively
        @input[row][col] = 0 #Reset and backtrace 
      end 
    end
    return false  
  end

  def print_output
    @input.each do |row|
      puts row.join(' ')
    end
  end

end


input = [ [0,3,0,0,6,8,0,0,0],
          [0,4,0,0,0,0,0,0,1],
          [1,0,0,3,0,0,0,7,0],
          [7,2,0,0,5,0,8,0,0],
          [0,0,4,0,0,0,6,0,0],
          [8,0,0,0,0,9,2,0,0],
          [0,0,0,0,2,0,0,0,0],
          [5,0,1,0,0,0,0,0,0],
          [0,0,0,0,0,5,0,9,0] 
        ]


solver = SudokuSolver.new(input)
if solver.solve
  solver.print_output()
else
  puts "Invalid Input"
end    





