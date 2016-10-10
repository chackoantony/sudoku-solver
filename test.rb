require 'minitest/autorun'
require_relative 'sudoku_solver'

class TestSudokuSolver < MiniTest::Unit::TestCase
  
  def setup
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
    @solver = SudokuSolver.new(input)
  end

  def test_solve
  	output = [[9, 3, 7, 1, 6, 8, 5, 2, 4], [6, 4, 2, 5, 9, 7, 3, 8, 1], [1, 5, 8, 3, 4, 2, 9, 7, 6], 
  	  [7, 2, 6, 4, 5, 3, 8, 1, 9], [3, 9, 4, 2, 8, 1, 6, 5, 7], [8, 1, 5, 6, 7, 9, 2, 4, 3], 
  	  [4, 7, 9, 8, 2, 6, 1, 3, 5], [5, 8, 1, 9, 3, 4, 7, 6, 2], [2, 6, 3, 7, 1, 5, 4, 9, 8]]
    assert_equal true, @solver.solve
    assert_equal output, @solver.input
  end

  def test_find_empty_position
  	assert_equal [0,0], @solver.find_empty_position
  end

  def test_row_eligible?
  	assert_equal true, @solver.row_eligible?(0, 1)
  	assert_equal false, @solver.row_eligible?(0, 6)
  end

  def test_col_eligible?
  	assert_equal true, @solver.col_eligible?(0, 2)
  	assert_equal false, @solver.col_eligible?(0, 8)
  end

  def test_box_eligible?
  	assert_equal true, @solver.box_eligible?(1, 0, 2)
  	assert_equal false, @solver.box_eligible?(1, 0, 4)
  end

  def test_can_insert?
  	assert_equal true, @solver.can_insert?(1, 0, 2)
  	assert_equal false, @solver.can_insert?(1, 0, 4)
  end


end