# Number spiral diagonals
# Problem 28
# Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:
#
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13
#
# It can be verified that the sum of the numbers on the diagonals is 101.
#
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

class SpiralMatrixSolver
  attr_reader :matrix, :current_x, :current_y, :current_digit, :step

  def initialize(size)
    @matrix = Array.new(size) { Array.new(size) { 0 } }
    fill_middle_cell
  end

  def fill_middle_cell
    @current_x, @current_y = matrix_middle, matrix_middle
    @current_digit = starting_digit
    @step = 1

    fill_cell
  end

  def fill
    move_right = true
    loop do
      # last row(special case)
      if step == matrix_size
        if move_right
          step.times { @current_x += 1; fill_cell }
        else
          step.times { @current_x -= 1; fill_cell }
        end
        break
      end

      if move_right
        # right, then bottom
        step.times { @current_x += 1; fill_cell }
        step.times { @current_y += 1; fill_cell }
        move_right = false
      else
        # left, then top
        step.times { @current_x -= 1; fill_cell }
        step.times { @current_y -= 1; fill_cell }
        move_right = true
      end
      @step += 1
    end
  end

  def output_diagonal_sum
    sum = 0
    (0..(matrix_size - 1)).each do |i|
      (0..(matrix_size - 1)).each do |j|
        if i == j || i + j == matrix_size - 1
          sum += matrix[i][j]
        end
      end
    end
    puts sum
  end

  def output
    (0..(matrix_size - 1)).each do |i|
      (0..(matrix_size - 1)).each do |j|
        print matrix[i][j].to_s.ljust(3)
      end
      puts
    end
  end

  private

  def fill_cell
    @matrix[current_y][current_x] = current_digit
    @current_digit += 1
  end

  def matrix_middle
    @matrix_middle ||= (matrix.size - 1) / 2
  end

  def starting_digit
    @starting_digit ||= 1
  end

  def matrix_size
    @matrix_size ||= matrix.size
  end
end

a = SpiralMatrixSolver.new(1001)
a.fill
# a.output
a.output_diagonal_sum
