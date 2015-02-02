#Lattice paths
#Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
#
#How many such routes are there through a 20×20 grid?
require 'pp'

class LathicePaths
  attr_reader :paths_matrix

  def initialize(size)
    @paths_matrix = Array.new(size + 1) { Array.new(size + 1).fill(0) }
  end

  def calculate
    0.upto(paths_matrix_size - 1).each do |layer|
      fill_layer(layer)
    end
  end

  def output
    # pp paths_matrix
    pp paths_matrix[paths_matrix_size - 1][paths_matrix_size - 1]
  end

  private
  def fill_layer(layer)
    (layer..(paths_matrix_size - 1)).each do |i|
      (layer..(paths_matrix_size - 1)).each do |j|
        if i == layer || j == layer
          if layer == 0
            @paths_matrix[i][j] = 1
          else
            @paths_matrix[i][j] = paths_matrix[i][j - 1] + paths_matrix[i - 1][j]
          end
        end
      end
    end
  end

  def paths_matrix_size
    @paths_matrix_size ||= paths_matrix.size
  end
end

o = LathicePaths.new(20)
o.calculate
o.output

