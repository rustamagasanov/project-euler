#Lattice paths
#Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
#
#How many such routes are there through a 20×20 grid?
class LathicePaths
  attr_reader :paths_matrix

  def initialize(size)
    @paths_matrix = Array.new(size + 1) { Array.new(size + 1).fill(0) }
  end

  def calculate
    0.upto(paths_matrix_size - 1).each { |layer| fill_layer(layer) }
  end

  private
  def fill_layer(layer)
    (layer..(paths_matrix_size - 1)).each do |i|
      (layer..(paths_matrix_size - 1)).each do |j|
        if i == layer || j == layer
         @paths_matrix[i][j] = (layer == 0) ? 1 : paths_matrix[i][j - 1] + paths_matrix[i - 1][j]
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
puts o.paths_matrix[20][20]

